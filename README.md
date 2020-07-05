## Welcome to SwiftRef

This is the development home of SwiftRef, a community project to create a
technical reference for the [Swift programming language](http://swift.org).

Please see the [latest published draft](https://dabrahams.github.io/SwiftRef/)
for information about the motivation for this project.

### Infrastructure

The reference is developed as a [Jekyll](https://jekyllrb.com) website,
currently being served by [GitHub Pages](https://pages.github.com).

### Conventions and Guidelines

* Avoid unnecessary HTML tags; use Markdown formatting to the degree possible.
* Wrap lines at 80 columns to support diff-friendly change tracking.
* Follow writing conventions spelled out [in the
  document](https://dabrahams.github.io/SwiftRef/chapters/intro.html#conventions).
* Chapters are represented as individual Markdown files in the chapters/
  subdirectory.
* Each chapter begins with a 2nd-level heading, e.g. `## Chapter Name`.  All
  other headings in a chapter are 3rd-level and below.
* Each file's name starts with a 4-digit number that determines its order in the
  overall document.  Initial numbering is spaced by 100s.
* Maintain stable file names and heading titles for linkability until another
  solution is in place.

### Development Hints

Creating a complete installation of jekyll and all the parts needed for github
pages development can be fraught.  If you install
[docker-compose](https://docs.docker.com/compose/), you can start a webserver
serving the site at http://localhost:4000 by invoking

```
docker-compose up
```

in the root directory of your working copy.
