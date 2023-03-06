# SkoHub Docker Vocabs

This is a example repository to show how you can publish your SKOS vocabulary using GitHub infrastructure.

Every time a push is made to the repository a GitHub-workflow-action is triggered to publish the most recent vocabulary to the `gh-pages`-branch, which is used by GitHub pages.
It spins up a Docker-Container made out the [SkoHub-Vocabs](https://github.com/hbz/skohub-vocabs)-tool. You can have a look at the Dockerfile [at this branch of skohub-vocabs](https://github.com/skohub-io/skohub-vocabs/tree/docker-gh-pages).

## Reuse

If you want to reuse this repo and have your vocabulary automatically pushed und published via GitHub-Pages, follow these steps (also explained [in these slides including screenshots](https://pad.gwdg.de/p/2022-11-30-swib22-skos-workshop-slides#/51)):

1. Fork this repo

2. go to the `.github/workflows/main.yml`-file, make sure to replace the following lines:

- `run: git clone https://github.com/skohub-io/skohub-docker-vocabs.git data/` ⬅ adjust the path to point to **YOUR** repository
- `run: echo "BASEURL=/skohub-docker-vocabs" > .env` ⬅ the `BASEURL` has to be set to **YOUR** repository name (only necessary if you changed the repository name; if you just forked and did not rename, leave it as it is)

3. in your repository settings go to the "GitHub Pages" setting and select `gh-pages` as the branch your site is being built from. If it is not available yet, you might have to push something to your repo, so the GitHub-Action gets triggered or you can trigger it manually with going to "Actions" in the menubar, then select the workflow "Build /public and deploy..." and click "Run workflow". This way you can trigger the workflow automatically.

4. after that your vocabulary will be automatically published every time a push to this repo is made.

5. Any issues? Please open up a issue [here](https://github.com/skohub-io/skohub-docker-vocabs/issues)

## Example workflow file

```yaml
name: Build /public and delpoy to gh-pages with docker container

on:
  push:
    branches:
      - master
      - main
      - gh-pages
  workflow_dispatch:
    inputs:
      logLevel:
        description: 'Log level'
        required: true
        default: 'warning'
      tags:
        description: 'Test scenario tags'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2 # If you're using actions/checkout@v2 you must set persist-credentials to false in most cases for the deployment to work correctly.
        with:
          persist-credentials: false

      - name: remove public and data-dir if already exists
        run: rm -rf public data

      - run: mkdir public

      - run: mkdir data

      - run: git clone https://github.com/skohub-io/skohub-docker-vocabs.git data/

      - name: make .env file
        run: echo "BASERURL=/skohub-docker-vocabs" > .env

      - name: build public dir with docker image
        run: docker run -v $(pwd)/public:/app/public -v $(pwd)/data:/app/data -v $(pwd)/.env:/app/.env skohub/skohub-vocabs-docker:latest

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

## FAQ

- During the build I get an error saying `The requested URL returned error: 403`
  - You maybe need to update permissions like described here: https://github.com/peaceiris/actions-gh-pages/issues/744
  - Go to `Settings` > `Actions` > `General` > `Workflow permissions` and toggle the Read and write permissions

## CHANGELOG

09.02.2021:

- In an earlier version, there was the .env variable `PATH_PREFIX` set to point to the repository the vocabulary is hosted at. To align with rest of code, this was changed to `BASEURL`.
- The docker image now also support i18n
