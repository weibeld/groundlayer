# GroundLayer Website

Website created with WordPress and served as a static website with GitHub Pages.

## Introduction

The project is based on the following tools:

- [Local](https://localwp.com/): tool for managing local WordPress installations and websites
- [Simply Static](https://wordpress.org/plugins/simply-static/): WordPress plugin for exporting a WordPress website as a static website
- [Aeonium](https://wordpress.org/themes/aeonium/): WordPress theme used to build the website

The website is built with WordPress locally and then exported as a static website. These static website files are then served by GitHub Pages (WordPress itself is never exposed to the internet).

## Organisation

The repository consists of two main directories:

- [`wordpress`](wordpress): contains the WordPress installation, including themes, plugins, and database content
- [`docs`](docs): contains the exported static website to be served by GitHub Pages

> Note: GitHub Pages can only serve from the root directory of the repo or from the `/docs` directory. Since the root directory also contains other stuff, `docs` is used.

## Edit website

To edit the website, proceed as follows:

1. Install [Local](https://localwp.com/)
1. Zip the [`wordpress`](wordpress) directory to a location outside of the repository
1. In Local, click _File > Import site_ and select the `wordpress.zip` file created above
1. Choose a name for the website (e.g. `groundlayer`) and set the local site path to a location **outside** the repository (e.g. `groundlayer-local`)
1. Import the website

Now, the website can be edited as usual through the WordPress Admin Dashboard.

To commit the changes back to the repository, proceed as follows:

1. In Local, right-click on the website and click _Restart_
    - This is to ensure that the changes are flushed to disk
1. Copy the content of the local website directory into the `wordpress` directory in the repository
    - e.g. `rsync -a --delete groundlayer-local/ groundlayer/wordpress`
1. Commit the changes to the repository

> Note: once the website has been imported into Local, further edits can be made on the same local copy. The changes can be committed back to the repository as described above.

## Export static website files

To export the website as a static website, proceed as follows:

1. In the WordPress Admin Dashboard, select _Simply Static > Settings_, set _Delivery Method_ to _Local Directory_, and enter a local directory **outside** the repository (e.g. `groundlayer-site`)
1. In the WordPress Admin Dashboard, select _Simply Static > Generate > Generate Static Files_ 
1. Copy the generated static files into the `docs` directory in the repository
    - e.g. `rsync -a --delete groundlayer-site/ groundlayer/docs`
1. Commit the changes to the repository

## Notes

### WordPress

The credentials for the WordPress Admin Dashboard are as follows:

- Username: admin
- Password: 12345678

> Note: the WordPress Admin Dashboard is only used locally and will never be exposed on the internet (since only the exported static website files will be exposed), thus no secure credentials are needed.

### GitHub Pages

GitHub Pages must be configured to serve from the `docs` directory in the `main` branch.

### Assets

- Icons for service descriptions from [Flaticon](https://www.flaticon.com/packs/engineering-165)
- Colour of PNG files converted with the following command:
    ```bash
    convert file.png -fill "#ABCDEF" -colorize 100 file-out.png
    ```
