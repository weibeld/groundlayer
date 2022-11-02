# GroundLayer Website

## Structure

The repo consists of two main directories:

- [`wordpress`](wordpress): contains the WordPress installation, including themes, plugins, and database content
- [`docs`](docs): contains the exported static website to be served by GitHub Pages

> GitHub Pages can only serve from the root directory of the repo or from a `/docs` subdirectory. Since the root directory also contains other stuff, `/docs` is used.

## Editing

To edit the website, proceed as follows:

1. Install [Local](https://localwp.com/)
1. Zip the [`wordpress`](wordpress) directory to a location outside of the repository
1. In Local, click _File > Import site_ and select the `wordpress.zip` file created above
1. Choose any desired name for the website, e.g. `groundlayer` and set the local site path to a suitable location outside of the repository
1. Import the website

Now, the website can be edited as usual through the WordPress Admin Dashboard.

To commit the changes back to the repository, proceed as follows:

1. In Local, right-click on the website and click _Restart_
    - This is to ensure that the changes are flushed to disk
1. Copy the content of the website directory into the [`wordpress`](wordpress) directory in the repository, replacing the previous content of the `wordpress` directory
    - Find out the location of the website directory with _Go to site folder_ in Local
1. Commit the changes in the repository

> Note that once the website has been imported into Local, further edits can be made on the same import, and the changes can be committed back to the repository as described above.

## Export

The website is exported as a static website with the [Simply Static](https://wordpress.org/plugins/simply-static/) plugin.

To export the website, select _Simply Static > Generate > Generate Static Files_ in the WordPress Admin Dashboard and make sure that the files are exported to the [`docs`](docs) directory.

## WordPress

The credentials for the WordPress Admin Dashboard are as follows:

- Username: admin
- Password: 12345678

> The WordPress Admin Dashboard is only used locally and will never be exposed on the internet (since only the exported static website files will be exposed), thus no secure credentials are needed.

## GitHub Pages

GitHub Pages must be configured to serve from the [`docs`](docs) directory in the `main` branch.

