# Argon18
Argon18 is a small gem designed for making small demo websites while still being able to easily use common dev tools such as [slim](https://github.com/slim-template/slim) and/or [Sass](https://sass-lang.com).

Existing features:

- Creating webpages using Slim
    - Arbitrary Ruby code execution through Slim
- Serving of static files (images, javascript, etc.)
- Exporting an argon project to static html pages

Planned features:

- Sass support
- Erb support

## Links

- [RubyGems Page](https://rubygems.org/gems/argon18)

## How to use Argon18
An argon project is expected to have two folders, *public* and *views*. Public will contain the static files such as the websites images, javascript files, etc. and views will contain the Slim files. An example project could look like this.
```
+-- project
    +-- public
        +-- imgs
            +-- my_pic.png
        +-- js
            +-- my_js.js
    +-- views
        +-- index.slim
        +-- other.slim
        +-- more_pages
            +-- another.slim
```
Then run the `argon18` gem executable in the `project` folder which will start a web server running on port 9292. Any url without a file extension will be interpreted as a request for a web page. For example localhost:9292/other would correspond to the file project/views/other.slim. There's also a special case for localhost:9292/ which will look for projct/views/index.slim. Any url with a file extension will be searched for in public. As an example localhost:9292/imgs/my\_pic.png would correspond to the file project/public/imgs/my\_pic.png.

### Exporting to static html pages
If argon is run with the `-E` flag it will render the slim files to html files and copy all needed files to a new directory called `output` located in the projects root directory. These files can then be served by a regular static http server (for example `ruby -run -e httpd . -p 8000`) without any further configuration.
