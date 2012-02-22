# markdpwn

Rails engine providing a clone of Git-flavored Markdown.


## Usage

**Disclaimer**: this gem uses semantic versioning, so its API is not guaranteed
to be stable until it reaches version 1.0. Use integration tests to avoid
surprises.

```ruby
require 'markdpwn'
code = "puts {:key => nil}.inspect\n"
Markdpwn.markup code, :file_name => 'code.rb', :mime_type => 'text/x-ruby'
```

The `markup` call above outputs the HTML code below.

```html
<div class="markdpwn-parsed-code">
<span class="nb">puts</span> <span class="p">{</span><span class="ss">:key</span> <span class="o">=&gt;</span> <span class="kp">nil</span><span class="p">}</span><span class="o">.</span><span class="n">inspect</span>
</div>
```

You can pass `:file_name` and/or `:mime_type` to help `markup` figure out
which formatter to use. If no option is present, pygments is asked to guess the
text document's language.

If you know the contents is _markdpwn_ (close to Github-Flavored Markup), use
the `markdpwn` method directly.

```ruby
require 'markdpwn'
comment = "I like what you did to `markdpwn`." 
Markdpwn.markdpwn comment
# => "<p>I like what you did to <code>markdpwn</code>.</p>\n"
```

## Dependencies

The `pygments.rb` gem requires the Python VM library and the `pygments` package.
They are installed by default on OSX and Ubuntu. The following command installs
them on Fedora.

```bash
sudo yum install -y python-devel python-pygments
``` 

The `github-markup` gem requires `asciidoc`, PERL together with the
`Pod::Simple` library, and Python together with the `rst2html` tool. The
following command installs them on Fedora. 

```bash
sudo yum install -y asciidoc perl-Pod-Simple python-docutils
```


## Contributing to markdpwn
 
* Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it
  and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to
  have your own version, or is otherwise necessary, that is fine, but please
  isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Victor Costan. See LICENSE.txt for further details.
