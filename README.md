drone-netlify
=============

**Publish to your netlify sites with drone CI**

```yml
pipeline:
  publish:
    image: sbruder/drone-netlify
    key: MY_NETLIFY_KEY
```

Using secrets:


```yml
pipeline:
  publish:
    image: sbruder/drone-netlify
    secrets: [ netlify_key ]
```

Your repository has to be initialized with `netlifyctl deploy` before (a
`netlify.toml` file has to exist).

## Parameter/Secret Reference

`key` - Netlify “Personal access token” (Account Settings → OAuth appilcations)
