module Puppet::Parser::Functions
  newfunction(:deprecate, :type => :rvalue, :doc => <<-EOD

    A puppet function to show deprecations in your manifests

      deprecate($date, $reason)

      deprecate($date, $reason, $abort)

    A usage example -

      class contractor {

        user { 'foo': }

        deprecate('2015-01-25', 'Remove Foo at the end of the contract.')

      }

    `deprecate` takes 2 or 3 arguments.

      * A date string, in either YYYYMMDD or YYYY-MM-DD formats
      * A free form string describing the what and why of the deprecation
      * An optional boolean to control if the run should be aborted. Defaults to false

  EOD
  ) do |args|

    unless args.length >= 2 && args.length <= 3
      fail ArgumentError, ("deprecate(): wrong number of arguments (#{args.length} must be 2 or 3)")
    end

    date             = args[0].gsub(/-/, '')
    reason           = args[1]
    fail_compilation = args[2] || false

    unless date.length == 8
      fail ArgumentError, ('deprecate(): Date must be provided in YYYY-MM-DD format')
    end

    # YYYY MM DD - one true timestamp
    now = Time.now.strftime('%Y%m%d')

    if (now >= date)
      rsrc = "#{@resource.type.capitalize}[#{@resource.name}]"
      message = "#{rsrc} expired on #{date}: #{reason}"

      Puppet.warning message

      if fail_compilation
        function_fail([message])
      else
        Puppet.warning message
      end
    end
  end
end
