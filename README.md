# Rumbl

This is the state of my rumbl project after finishing [Programming Phoenix][book] beta 9.
(rumbrella if you finished the book.)
I modified the settings to use **.secret.exs** files that are not in version control.
**.secret.exs.example** files exist that can be copied and modified to get up and running.

The **snippets** directory is an incomplete listing of **iex** snippets keyed into files.
There is a good chance the files in this directory worked when I keyed them in,
but stopped working as I went through the book.
Some of the snippets may have been modified as I progressed through the book.
In other words, no guarantees.

Do the following to deploy this app.

```sh
git clone git@github.com:sgeos/rumbl.git
cd rumbl
(cd apps/info_sys/config; cp info_sys.secret.exs.example info_sys.secret.exs)
# add your WolframAlpha app id to apps/info_sys/config/info_sys.secret.exs
(cd apps/rumbl/config; cp prod.secret.exs.example prod.secret.exs)
# add your secret key base and database settings to apps/info_sys/config/prod.secret.exs
(cd apps/rumbl/config; cp dev.secret.exs.example dev.secret.exs)
# add your database settings to apps/info_sys/config/dev.secret.exs
(cd apps/rumbl/config; cp test.secret.exs.example test.secret.exs)
# add your database settings to apps/info_sys/config/test.secret.exs
mix deps.get
mix ecto.create -r Rumbl.Repo
mix ecto.migrate -r Rumbl.Repo
mix run apps/rumbl/priv/repo/seeds.exs
mix run apps/rumbl/priv/repo/backend_seeds.exs
(cd apps/rumbl; npm install)
```

Test the app.

```sh
mix test
```

Start the server.

```sh
mix phoenix.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Check out the [Phoenix deployment guides](http://www.phoenixframework.org/docs/deployment)
if you want to run in production.

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Books

  * [Programming Phoenix Book][book]
  * [Programming Elixir 1.2 Book][elixir-book]
  * [Metaprogramming Elixir Book][metaprogramming-book]

[book]: https://pragprog.com/book/phoenix/programming-phoenix
[elixir-book]: https://pragprog.com/book/elixir12/programming-elixir-1-2
[metaprogramming-book]: https://pragprog.com/book/cmelixir/metaprogramming-elixir

