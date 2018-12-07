gitlab_repo = https://github.com/sandstormports/gitlabhq.git
gitlab_repo_branch = sandstorm-app
gitlab_shell_repo = https://github.com/sandstormports/gitlab-shell.git
gitlab_shell_repo_branch = sandstorm-app

gitlab_workhorse_repo = https://gitlab.com/gitlab-org/gitlab-workhorse.git

all: gitlab-setup gitlab-shell-setup gitlab-workhorse/gitlab-workhorse

# Set up the GitLab Rails app

gitlab-setup: gitlab/.git /opt/ruby/gitlab-bundle initdb.sqlite3

gitlab/.git:
	git clone ${gitlab_repo} gitlab && cd gitlab && git checkout ${gitlab_repo_branch}

/opt/ruby/gitlab-bundle:
	cd gitlab && bundle install --path /opt/ruby/gitlab-bundle --without test development --jobs 1 --standalone

initdb.sqlite3: /opt/ruby/gitlab-bundle
	rm -rf db
	mkdir db
	find /opt/ruby/gitlab-bundle -type f -name "jquery.atwho.js" -exec sed -i 's/@ sourceMappingURL=jquery.caret.map//g' {} \;
	cd gitlab && SECRET_KEY_BASE='not so secret' RAILS_ENV=production ./bin/rake db:create db:setup && SECRET_KEY_BASE='not so secret' RAILS_ENV=production ./bin/rake assets:precompile
	mv db/db.sqlite3 initdb.sqlite3
	rm -rf db
	ln -s /var/sqlite3 db

# Set up gitlab-shell

gitlab-shell-setup: gitlab-shell/.git

gitlab-shell/.git:
	git clone ${gitlab_shell_repo} gitlab-shell && cd gitlab-shell && git checkout ${gitlab_shell_repo_branch}

gitlab-workhorse/.git:
	git clone ${gitlab_workhorse_repo} gitlab-workhorse

gitlab-workhorse/gitlab-workhorse: gitlab-workhorse/.git
	cd gitlab-workhorse && git checkout f184885d77ba7 && make
