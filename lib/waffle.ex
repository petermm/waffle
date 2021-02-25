defmodule Waffle do
  @moduledoc ~S"""
  Waffle is a flexible file upload library for Elixir with straightforward integrations for Amazon S3 and ImageMagick.

  ## Installation

  Add the latest stable release to your `mix.exs` file, along with the
  required dependencies for `ExAws` if appropriate:

      defp deps do
        [
          {:waffle, "~> 1.1"},

          # If using S3:
          {:ex_aws, "~> 2.1.2"},
          {:ex_aws_s3, "~> 2.0"},
          {:hackney, "~> 1.9"},
          {:sweet_xml, "~> 0.6"}
        ]
      end

  Then run `mix deps.get` in your shell to fetch the dependencies.

  ## Usage

  After installing Waffle, another two things should be done:

  1. setup a storage provider
  2. define a definition module

  ### Setup a storage provider

  Waffle has two built-in storage providers:

  * `Waffle.Storage.Local`
  * `Waffle.Storage.S3`

  [Other available storage providers](#other-available-storage-providers)
  are supported by the community.

  An example for setting up `Waffle.Storage.Local`:

      config :waffle,
        storage: Waffle.Storage.Local,
        asset_host: "http://static.example.com" # or {:system, "ASSET_HOST"}

  An example for setting up `Waffle.Storage.S3`:

      config :waffle,
        storage: Waffle.Storage.S3,
        bucket: "custom_bucket",                # or {:system, "AWS_S3_BUCKET"}
        asset_host: "http://static.example.com" # or {:system, "ASSET_HOST"}

      config :ex_aws,
        json_codec: Jason
        # any configurations provided by https://github.com/ex-aws/ex_aws

  ### Define a definition module

  Waffle requires a **definition module** which contains the relevant
  functions to store and retrieve files:

  * Optional transformations of the uploaded file
  * Where to put your files (the storage directory)
  * How to name your files
  * How to secure your files (private? Or publicly accessible?)
  * Default placeholders

  This module can be created manually or generated by `mix waffle.g`
  automatically.

  As an example, we will generate a definition module for handling
  avatars:

      mix waffle.g avatar

  This should generate a file at `lib/[APP_NAME]_web/uploaders/avatar.ex`.
  Check this file for descriptions of configurable options.

  ## Examples

  * [An example for Local storage driver](./local.html)
  * [An example for S3 storage driver](./s3.html)

  ## Usage with Ecto

  Waffle comes with a companion package for use with Ecto. If you
  intend to use Waffle with Ecto, it is highly recommended you also
  add the
  [`waffle_ecto`](https://github.com/elixir-waffle/waffle_ecto)
  dependency.  Benefits include:

    * Changeset integration
    * Versioned urls for cache busting (`.../thumb.png?v=63601457477`)

  ## Other Storage Providers

    * **Rackspace** - [arc_rackspace](https://github.com/lokalebasen/arc_rackspace)

    * **Manta** - [arc_manta](https://github.com/onyxrev/arc_manta)

    * **OVH** - [arc_ovh](https://github.com/stephenmoloney/arc_ovh)

    * **Google Cloud Storage** - [waffle_gcs](https://github.com/kolorahl/waffle_gcs)

    * **Microsoft Azure Storage** - [arc_azure](https://github.com/phil-a/arc_azure])

    * **Aliyun OSS Storage** - [waffle_aliyun_oss](https://github.com/ug0/waffle_aliyun_oss)

  ## Further reading

    * `Waffle.Definition`

  """
end
