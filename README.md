# mac-setup

Automate your development environment setup on macOS.

## How to use

1. Clone this repository:

```
git clone https://github.com/your-username/mac-setup.git
cd mac-setup
```

2. Give execution permission to the script:

```
chmod +x setup.sh
```

3. Run the main script:

```
./setup.sh
```

4. Configure your SSH keys:

- Generate separate keys for personal and work use.
- Configure the `~/.ssh/config` file following the example below:

  ```
  # Personal account
  Host github.com-personal
      HostName github.com
      User git
      IdentityFile ~/.ssh/id_ed25519_personal
      IdentitiesOnly yes

  # Work account
  Host github.com-work
      HostName github.com
      User git
      IdentityFile ~/.ssh/id_ed25519_work
      IdentitiesOnly yes
  ```

- Add the public keys to GitHub.

5. Cloning repositories:

- Personal: `git clone git@github.com-personal:username/repository.git`
- Work: `git clone git@github.com-work:company/repository.git`

6. Customize and copy the `.zshrc.example` and `.gitconfig.example` files to your home directory.

## Notes

- Android Studio must be downloaded manually from the official website.
