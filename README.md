# strapdown-workspace

> strapdown.js + livereload = embarrassingly awesome markdown

## Who Is This For
You:

1.  should know what [grunt][gruntjs] is and how to use it.
2.  should have [grunt-cli][grunt-cli] installed.
3.  should know what [livereload][livereload] is and how it works.
4.  should be able to understand how [strapdown.js][strapdown.com] works.
5.  should be able to understand the [gruntfile][gruntfile] of this project so that you know what's going on under the hood.

*(Why so many "you should"? See FAQ below.)*

## What Is This
See section "who is this for" above.

## Usage(Workflow)
For example, my current workflow:

1.  Open a **terminal#1**, and set up strapdown-workspace:

    ```shell
    git clone https://github.com/cxyokk/strapdown-workspace
    cd strapdown-workspace
    # npm install # no need to do this
    grunt
    ```
    Now strapdown-workspace should be up and running. We will leave terminal#1 as it is.

2.  Open a **terminal#2**, and drop your markdown file into strapdown-workspace:

    ```shell
    cd strapdown-workspace/files/markdown
    cp path/to/xxx.md .
    ```
    Now that `xxx.md` is under strapdown-down's watch, you can open it with your favorite editor, e.g.:
    ```shell
    vim xxx.md
    ```

3.  Open a **browser#3** and go to `http://localhost:9008/xxx.md`(or replace 'localhost' with some hostname), you should see the perfectly styled markdown.

4.  Resize **terminal#2** and **browser#3**, make each window occupies half a screen. Now you can edit your markdown file on terminal#2 and browser#3 will automaticlly refresh the page whenever you save your file.

5.  When you are done, press `ctrl-c` on terminal#1 to exit strapdown-workspace and do whatever you want with the markdown and styled html fils on terminal#2 located in `strapdown-workspace/files`.

## FAQ
1.  **In section "who is this for" above, why so many "you should"?**

    So I can keep this FAQ shorter.

2.  **Why did you use [grunt-regarde][grunt-regarde]? It's deprecated and there is a new one called [grunt-contrib-watch][grunt-contrib-watch].**

    Haven't got time to read grunt-contrib-watch's docs.

3.  **Why didn't you add `node_modules` to your `.gitignore`?**

    See this [post][node-modules-git].

    TL;DR: strapdown-workspace is planned to be deployed, not planned to be reused.

4.  **Still don't get it...**

    Read that post.

5.  **Why do you use coffee-script all the time?**

    I don't know why.

6.  **What's your favorite number?**

    See [grunt-strapdown][grunt-strapdown].

## License
MIT license, see [LICENSE](LICENSE).

[gruntjs]: http://gruntjs.com
[grunt-cli]: https://github.com/gruntjs/grunt-cli
[livereload]: https://github.com/livereload/LiveReload2
[gruntfile]: https://github.com/cxyokk/strapdown-workspace/blob/master/Gruntfile.coffee
[strapdown.com]: http://strapdownjs.com
[node-modules-git]: http://www.futurealoof.com/posts/nodemodules-in-git.html
[grunt-strapdown]: https://github.com/cxyokk/grunt-strapdown/
[grunt-regarde]: https://github.com/yeoman/grunt-regarde
[grunt-contrib-watch]: https://github.com/gruntjs/grunt-contrib-watch
