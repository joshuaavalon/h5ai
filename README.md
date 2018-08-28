![h5ai](icon.png?raw=true "h5ai")
# h5ai

This is a fork of [h5ai][h5ai]. Since the maintainer stopped developing, this repository is meant to provide Docker support and add some features on top of it.

The public issue tracker is located at [GitHub][github] but the source code it hosted on [private GitLab server][gitlab].
GitHub source code will be a mirror and PR will be merge at GitLab instead.

[Original Readme](./h5ai.md).

## Usage

```
docker run -d -p 8080:80 --name h5ai -v /data:/var/www/html/data:ro joshuaavalon/h5ai
```

This image expose the port at port 80.
You should mount the you files at `/var/www/html`.
Note that **DO NOT** mount direct to `/var/www/html` as it overwrites `/var/www/html/_h5ai`.

Also, you need to make sure Apache has right to read your files.

## Environment Variables

* `PUID`: Apache user ID
* `PGID`: Apache group ID


[h5ai]: https://github.com/lrsjng/h5ai
[gitlab]: https://git.joshuaavalon.io/joshuaavalon/h5ai
[github]: https://github.com/joshuaavalon/h5ai
