# gitlab-password-reset-script
A ruby on rails script for GitLab to reset password of users

The scripts in here are inspired by the script provided by GitLab:
https://about.gitlab.com/releases/2022/03/31/critical-security-release-gitlab-14-9-2-released/#script-to-identify-users-potentially-impacted-by-cve-2022-1162

To run a script, place it in /tmp/ and run it. Example:

```
sudo gitlab-rails runner /tmp/reset-all-passwords.rb
```
