# Hack with Ansible

Getting into the habit of flattening my lab machines regularly with some automation to help out.

Use some Ansible and simple shell scripts to get a [Blackarch](https://blackarch.org/)
install that *actually looks good*, with bare bones tooling, but the power of
the blackarch repos.

## Health Warning

This is very much work in progress. You'll find half-complete tool lists and so on.

# Install some Arch stuff!

There are four main roles for Arch builds right now:
* base
* desktop
* testing_desktop
* testing_headless

Base gives you a headless machine, desktop gives you one with i3 and Gnome
environments. testing_headless gives you cli Pen Testing tools and the desktop
version adds some gui tooling. All the testing tooling is bare bones, because
you'll have Blackarch configured, so you can get most stuff at will.

To use these roles, you'll need an arch base install - basically just follow the install
guide, plus those steps below. You're free to do this, or you can use the VM install
script to just make a magic arch VM in a one-liner. This scripts is designed for use
in a VM, so single partition, no real battery/power management etc. are
configured in i3 at least.

## Getting your Arch base

### Arch VM Install script

Another WIP, this should be downloaded, then run, not piped to sh. You'll need
to interact with it. Try:

```bash
~$ curl https://raw.githubusercontent.com/blackfell/ansible-hax/main/arch_vim_install.sh > install.sh && sh -x ./install.sh | tee install.log
```
Check everything reboots and you're golden. At this point, you really should
think about adding your root SSH key over to the box.

### Manual install

Basically, just follow the Arch installation guide. Once you're done, make sure
you can SSH in as root **with a key**, maybe using:

```bash
~$ ssh-copy-id -i /path/to/your/key.pub root@hostname
```

Then check you've installed Python on the target and you're good to go.

## Installing Arch roles

### Get ready for SSH changes

**Warning** - All arch roles require *bf_arch_base*, which will configure SSH
and MOSH, slightly hardened on a port of your specification (let's say 2222).
This will deny password auth for your accounts and block root login, so you'll
need **keys**.

To be prepared for this, place any public SSH keys required for your ansible,
main and other user accounts in *files/* or another suitable
location so that ansible can copy them over for you. The names should match
those in *group_vars/all.yml* for each user account. 

### Pick your roles

You can cut this a few ways, but say you want a headless testing VPS, I like to
set up an inventory with a VPS group, with the associated hosts:


Note that on the first provision, playbook to apply the *bf_arch_base*
to your  and   

### Your SSH no longer works

We made your SSH configuration better, so now it doesn't work. Right?

This is because your first run of ansible used a weak SSH config logging in as
root, you'll need to make sure you configure access after this run. The best
way to do this is just to add the host to your ~/.ssh/config in my view :)

for your first run, your config file might look like this:

```
Host target.hostname
               User root
               Port 22
               IdentityFile ~/.ssh/my_root_key
```
Then after the first run, just switch it up:

```
Host ansible.target.hostname
              User myansible
              Port 2222
              IdentityFile ~/.ssh/my_ansible_key

Host target.hostname
              User blackfell
              Port 2222
              IdentityFile ~/.ssh/my_own_key
```
Note that the root entry is now effectively useless, since sshd will not allow
root logins anyway.

Using this approach,  you can just configure the inventory to use your ssh
config file from the outset (see the provided examples in that file).

Not too bad eh?
