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

- [`wordpress`](wordpress): contains the WordPress installation including the website being built
- [`docs`](docs): contains the static website files to be served by GitHub Pages

> Note: GitHub Pages can only serve from the `/`  or `/docs` directories. This is the reason that the directory containing the static website is called "docs" and not something more pertinent like "site".

Additonal top-level directories in the repository are:

- [`logo`](logo): contains design files for the website logo
- [`scripts`](scripts): contains various utility scripts

## Initial setup

To work on the website on a new development machine, the following initial steps have to be performed:

1. Install Local
1. Clone the repository
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

### 2. Clone the repository

```bash
git clone https://github.com/weibeld/groundlayer
```

### 3. Import website into Local

1. From the repository root directory, run the following script:
    ```bash
    scripts/import.sh
    ```
    This script creates `wordpress.zip` in the root directory which is a zipped version of the `wordpress` directory. It also clears the `wordpress` directory in the repo (will be repopulated by the Local import).
1. In Local, click **_File > Import site_** and select the **`wordpress.zip`** file created by the above script
1. Use the following settings for the import:

      - **Local site name:** `groundlayer` (may be anything else)
      - **Local site domain:** `groundlayer.local` (may be anything else)
      - **Local site path:** the `wordpress` directory of the repo **(must be exactly this)**

    The Local import moves files from the zip file back to the `wordpress` directory.
1. When the import completes, run `git status` in the repository and commit the changes (if any)

At this point, you can also click on _**Open site**_ in Local to verify that the website displays correctly.

### 3. Log in to WordPress

1. In Local, select the website just imported above
1. Click on _**WP Admin**_  to open the WordPress Admin Dashboard
1. In the WordPress login screen, enter the following credentials:
    - Username: **`admin`**
    - Password: **`12345678`**

> **Note:** these credentials are hardcoded in the WordPress project. Since this WordPress installation is only used locally and never exposed to the internet, no secure credentials are necessary.

### 4. Set up the Simply Static plugin

In the WordPress Admin Dashboard, go to **_Simply Static > Settings_** and ensure the following settins:

- **Delivery Method**: Local Directory
- **Local Directory**: the `docs` directory in the repository

## Editing the website

After the initial setup, the website can be edited as follows:

1. Edit the website through WordPress
1. In Local, restart the website with _**Right-click > Restart**_
    - This step ensures that all changes are written to disk
1. In WordPress, export the static website files with _**Simply Static > Generate > Generate Static Files**_
1. In the repository, commit and push the changes

After the changes have been pushed, the new version of the website is automatically picked up and served by GitHub Pages.

## Misc

### Assets

- Icons for service descriptions from [Flaticon](https://www.flaticon.com/packs/engineering-165)
- Colour of PNG files converted with the following command:
    ```bash
    convert file.png -fill "#ABCDEF" -colorize 100 file-out.png
    ```
