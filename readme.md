
# Create Nova Package CLI 


- This Speed up Scafolding of new laravel nova package tool by [spatie/skeleton-nova-tool](https://github.com/spatie/skeleton-nova-tool) using bash script on linux or any bash capable terminal
## Requirements
 - [Laravel Nova](https://nova.laravel.com/)

## Installation
- just do clone or download zip and add it to your bash_profile

```bash
alias create_nova=$HOME/Programs/create-nova.sh
```

## Defaults

```
 - `author_name` Default: whoami (system user)
 - `author_username` Default: git config username 
 - `author_email` Default: git config email 
 - `package_name` REQUIRED
 - `package_description` Default: A Laravel Nova Package
 - `vendor` Default: git config username 
 - `namespace_vendor` Default: git config username 
 - `namespace_tool_name` REQUIRED same value as package_name
 ```

 Next run `composer install`, `yarn` and `yarn production`.
 

## Usage


RUN :

`create-nova` or `/path/to/create-nova.sh`

```
What Is Your Package Name? (Use CamelCase)
Test
.
Whats Your Vendor Name?<enter>
Using Git Config Username as Default
.
What Is The Author's Name?<enter>
Setting System User As Default Author's Name
.
What Is The Author's Username?<enter>
Setting System User As Default Author's Username
.
Whats Your Author's Email<enter>
Using Git Config Email as Default Author's Email
.
Describe Your Laravel Nova Package.<enter>
Using Default Description
.
.
.
.
.
LARAVEL NOVA PACKAGE GENERATED! RUN `composer install` and `yarn && yarn production`
```

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
