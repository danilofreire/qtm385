# DATASCI 385 - Experimental Methods

This branch hosts the website for the course [QTM 385 - Experimental Methods](http://danilofreire.github.io/datasci385) at [Emory University](http://www.emory.edu). The course provides an introduction to randomised controlled trials and causal inference to undergraduate students.

## Building the website

I used [Quarto](https://quarto.org) to build the website, and the process was quite straightforward. To keep the website organised, I created a `gh-pages` branch and removed all unnecessary files.

The `_quarto.yml` file contains the configuration for the website, including the theme, the title, and the navigation bar. The website files are in the `docs/` folder, as it is one of the easiest ways to host a website on GitHub. I also added a `.nojekyll` file to the root of the repository to prevent GitHub from processing the website as a Jekyll project.

I then built the website with `quarto render` and pushed the changes to the `gh-pages` branch using `git push origin gh-pages`. On GitHub, I went to the `Pages` tab and deployed the website from the `docs` folder in the `gh-pages` branch.

For further information on how to build a website with Quarto, please refer to <https://quarto.org/docs/websites/>.

If you have any questions, please feel free to [open an issue](https://github.com/danilofreire/datasci385/issues) or [create a pull request](https://github.com/danilofreire/datasci385/pulls).

## License

The content of this repository is released under the [MIT License](LICENSE.qmd). You are free to use, modify or distribute it.
