# Hello World Page

This repository contains a minimal HTML "Hello World" example along with an additional `test.html` page you can publish on the same site.

## Running locally

To preview the page in a browser, start the local web server:

```bash
./run.sh
```

By default the page is served at <http://localhost:8000/index.html>. Set the `PORT` environment variable to use a different port, and visit <http://localhost:8000/test.html> to check the extra page.

## Publishing to GitHub

If you do not see the files on GitHub yet, push the branch to your repository.

### One-time push command

```bash
git remote add origin https://github.com/aidviseus/test.git  # skip if remote already exists
git branch -M main                                           # rename current branch to main if needed
git push -u origin main
```

After the first push you can simply run `git push` to publish new commits to the `main` branch.

### Using the helper script

To automate the process, run the helper script with your repository URL and optional branch name (defaults to `main`):

```bash
./publish.sh https://github.com/aidviseus/test.git
```

The script adds the `origin` remote if it does not already exist and then pushes the specified branch.
On subsequent runs you can omit the URL and simply execute:

```bash
./publish.sh
```

Use `./publish.sh <url> <branch>` if you need to push a different branch name.
