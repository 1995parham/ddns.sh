# ddns.sh
## Introduction
Run `ddns.sh` with the following command:

```sh
./ddns.sh -r $HOME/Documents/Git/parham/home.ip
```

After that it checks your public IP address each 1 hour then pushes it into the given repository.
Please note that Git creates a commit and pushes only when the IP address has been changed.
