# GroundLayer Website

Website created with WordPress and served as a static website with GitHub Pages.

## Introduction

The website is built with WordPress on the local machine. Then, the static website files (HTML, CSS, and JavaScript) are exported and saved in a separate directory. The files in this directory are then served as a static website by GitHub Pages.

The following tools are used:

- [Local](https://localwp.com/): tool for running WordPress on a local machine (alternative to installing WordPress manually)
- [Simply Static](https://wordpress.org/plugins/simply-static/): WordPress plugin for exporting a WordPress website as a static website
- [GitHub Pages](https://pages.github.com/): GitHub's service for serving static websites

> The WordPress theme used for the website is [Aeonium](https://wordpress.org/themes/aeonium/).

### Directory structure

The repository consists of the following main directories:

1. [`wordpress`](wordpress): contains the WordPress installation including the website being built
1. [`docs`](docs): contains the static website files to be served by GitHub Pages

> Note: GitHub Pages can only serve from the `/`  or `/docs` directories. This is the reason that the directory containing the static website is called "docs" and not something more pertinent like "site".

## Initial setup

To edit the website on a new development machine, the following initial steps have to be performed:

1. Install Local
1. Import the WordPress website into Local
1. Log in to WordPress
1. Set up the Simply Static plugin

In the following, each step is described in more detail.

### 1. Install Local

On macOS, Local can be installed with Homebrew:

```bash
brew install local
```

For other platforms, the installers can be obtained from the [Local website](https://localwp.com/).

### 2. Import website into Local

1. Clone the repository:
    ```bash
    git clone https://github.com/weibeld/groundlayer
    ```
1. Zip the `wordpress` directory of the repository to a file named **`wordpress.zip`** and save it somewhere **outside** of the repository
1. In Local, click **_File > Import site_** and select the **`wordpress.zip`** file created above
1. Choose a name for the project
    - Use, for example, the name **`groundlayer`**
1. Click on **_Advanced options_** and set the local site path to a directory **outside** the repository
    - Use, for example, the directory **`groundlayer-local`**
1. Select **_Preferred_** for the WordPress installation configuration
1. Click on **_Import site_**

### 3. Log in to WordPress

1. In Local, select the website just imported above
1. Click on _**WP Admin**_ (this opens the WordPress Admin Dashboard)
1. In the WordPress login screen, enter the following credentials:
    - Username: **`admin`**
    - Password: **`12345678`**

> **Note:** these credentials are preconfigured in the WordPress project. This WordPress installation is never exposed to the internet, but only used locally. Therefore, it's not necessary to have secure secret credentials.

### 4. Set up the Simply Static plugin

1. In the WordPress Admin Dashboard, go to **_Simply Static > Settings_** and make sure that **_Delivery Method_** is set to **_Local Directory_**
1. Set the **_Local Directory_** field to a directory on the local machine **outside** the repository
    - Use, for example, the directory **`groundlayer-site`**

## Editing the website

The workflow for editing and redeploying the website is as follows:

1. Edit the website through WordPress 
1. Export the static website files with the Simply Static plugin
1. Sync the updated WordPress project **and** the static website files to the repository
1. Commit and push the changes to GitHub

> N

The following gives more details about each step.

### Prerequisites

The below explanations assume that the [initial setup](#initial-setup) has been performed.

In particular, the following assumptions are made:

1. The repository has been cloned to a directory named `groundlayer` on the local machine
1. The WordPress project has been imported into Local (see [Import website into local](#import-website-into-local) above) and is saved in a directory named `groundlayer-local` on the local machien
1. The Simply Static plugin has been set up to export the static website files to a directory named `groundlayer-site` on the local machine (see [Set up Simply Static plugin](#set-up-the-simply-static-plugin) above)

### 1. Locally edit the website

1. In Local, select the website and click on **_WP Admin_** to open the WordPress Admin Dashboard
1. Edit the website through WordPress
1. Save the website in WordPress
1. In Local, **restart the website** by right-clicking it and selecting **_Restart_**

> The last step above is necessary to make sure that all edits made in WordPress are persisted to disk.

**The above should result in the updated WordPress project files being saved in the `groundlayer-local` directory.**

### 2. Export static website files

In the WordPress Admin Dashboard, click on  _**Simply Static > Generate > Generate Static Files**_ 

**The above should result in the static website files being saved in the `groundlayer-site` directory.**

### 3. Sync changes to repository

The files in both the `groundlayer-local` and `groundlayer-site` directories must now be synced to the corresponding directories in the repository.

To do so, execute the following:

```bash
rsync -a --delete groundlayer-local/ groundlayer/wordpress
rsync -a --delete groundlayer-site/ groundlayer/docs
rm -rf groundlayer-site/*
```

> Note the following about the above commands:
> 1. The `rsync` command ensures a complete sync, i.e. deleted files get deleted in the repository as well
> 1. The `rm` command clears the static website export directory after each sync. This ensures that obsolete files (i.e. files that are not used anymore, e.g. after deleting a website component) do not persist in the export directory
>     - This feature should actually be [implemented by Simply Static](https://github.com/patrickposner/simply-static/issues/30), however, it doesn't seem to work

### 4. Commit and push changes

Finally, commit and push the changes in the repository:

```bash
git add -A
git commit
git push
```

The updated version of the static website will now be automatically picked up and served by GitHub Pages.

## Misc

### Assets

- Icons for service descriptions from [Flaticon](https://www.flaticon.com/packs/engineering-165)
- Colour of PNG files converted with the following command:
    ```bash
    convert file.png -fill "#ABCDEF" -colorize 100 file-out.png
    ```
