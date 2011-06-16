use strict;
use warnings;
use Module::Build;
my $class = Module::Build->subclass(code => <<'END_CLASS');
sub copy_if_modified {
    my $self = shift;
    my %args = (@_ > 3
            ? ( @_ )
            : ( from => shift, to_dir => shift, flatten => shift )
            );
    $args{verbose} = !$self->quiet
        unless exists $args{verbose};

    my $file = $args{from};
    unless (defined $file and length $file) {
        die "No 'from' parameter given to copy_if_modified";
    }

    # makes no sense to replicate an absolute path, so assume flatten
    $args{flatten} = 1 if File::Spec->file_name_is_absolute( $file );

    my $to_path;
    if (defined $args{to} and length $args{to}) {
        $to_path = $args{to};
    } elsif (defined $args{to_dir} and length $args{to_dir}) {
        $to_path = File::Spec->catfile( $args{to_dir}, $args{flatten}
                        ? File::Basename::basename($file)
                        : $file );
    } else {
        die "No 'to' or 'to_dir' parameter given to copy_if_modified";
    }

    return if $self->up_to_date($file, $to_path); # Already fresh

    {
        local $self->{properties}{quiet} = 1;
        $self->delete_filetree($to_path); # delete destination if exists
    }

    # Create parent directories
    File::Path::mkpath(File::Basename::dirname($to_path), 0, oct(777));

    $self->log_verbose("Copying $file -> $to_path\n");

    if ($^O eq 'os2') {# copy will not overwrite; 0x1 = overwrite
        chmod 0666, $to_path;
        File::Copy::syscopy($file, $to_path, 0x1) or die "Can't copy('$file', '$to_path'): $!";
    } else {
        File::Copy::copy($file, $to_path) or die "Can't copy('$file', '$to_path'): $!";
    }
    if ($file eq 'lib/WebGUI/Paths.pm') {
        $self->_mod_paths($to_path);
    }

    # mode is read-only + (executable if source is executable)
    my $mode = oct(444) | ( $self->is_executable($file) ? oct(111) : 0 );
    chmod( $mode, $to_path );

    return $to_path;
}

sub _mod_paths {
    my $self = shift;
    my $file = shift;
    open my $fh, '<', $file;
    my $content = do { local $/; <$fh> };
    close $fh;
    my $etc = $self->notes('etc_dir');
    $content =~ s/my \$root = .*?;/use File::ShareDir ':ALL';/ms;
    $content =~ s/(my \$share =).*?;/$1 dist_dir('WebGUI');/;
    $content =~ s/(my \$etc =).*?;/$1 '$etc';/;
    open $fh, '>', $file;
    print {$fh} $content;
    close $fh;
}

END_CLASS
my $build = $class->new(
    module_name => 'WebGUI',
    dist_abstract => 'WebGUI CMS',
    license  => 'gpl2',
    share_dir => 'share',
    requires => {
        'perl'          => '5.10.0',
        'LWP'                              => 5.833,
        'Net::DNS'                         => 0.66,
        'Try::Tiny'                        => 0.07,
        'HTTP::Request'                    => 1.40,
        'HTTP::Headers'                    => 1.61,
        'Test::Deep'                       => 0.095,
        'Digest::MD5'                      => 2.38,
        'DBI'                              => 1.607,
        'DBD::mysql'                       => 4.010,
        'HTML::Parser'                     => 3.60,
        'Archive::Tar'                     => 1.44,
        'Archive::Zip'                     => 1.26,
        'IO::Zlib'                         => 1.09,
        'Compress::Zlib'                   => 2.015,
        'Net::SMTP'                        => 2.31,
        'MIME::Tools'                      => 5.427,
        'Net::POP3'                        => 2.29,
        'Tie::IxHash'                      => 1.21,
        'XML::Simple'                      => 2.18,
        'DateTime'                         => 0.4501,
        'Time::HiRes'                      => 1.9719,
        'DateTime::Format::Strptime'       => 1.0800,
        'DateTime::Format::Mail'           => 0.3001,
        'DateTime::Format::HTTP'           => 0.38,
        'Image::Magick'                    => 6.0,
        'Log::Log4perl'                    => 1.20,
        'Net::LDAP'                        => 0.39,
        'HTML::Highlight'                  => 0.20,
        'HTML::TagFilter'                  => 1.03,
        'HTML::Template'                   => 2.9,
        'XML::FeedPP'                      => 0.40,
        'XML::FeedPP::MediaRSS'            => 0.02,
        'JSON'                             => 2.12,
        'JSON::Any'                        => 1.22,
        'Config::JSON'                     => 1.5000,
        'Text::CSV_XS'                     => 0.64,
        'Net::CIDR::Lite'                  => 0.20,
        'Finance::Quote'                   => 1.15,
        'POE'                              => 1.005,
        'POE::Component::IKC::Server'      => 0.2001,
        'POE::Component::Client::HTTP'     => 0.88,
        'Plack'                            => 0.9949,
        'Plack::Request'                   => 0,
        'Plack::Response'                  => 0,
        'Plack::Middleware::Status'        => 0,
        'Plack::Middleware::Debug'         => 0,
        'URI::Escape'                      => 3.29,
        'POSIX'                            => 0,
        'List::Util'                       => 0,
        'Color::Calc'                      => 0,
        'Weather::Com::Finder'             => '0.5.3',
        'HTML::TagCloud'                   => 0.34,
        'Image::ExifTool'                  => 7.67,
        'Archive::Any'                     => 0.0932,
        'Path::Class'                      => 0.16,
        'Exception::Class'                 => 1.26,
        'List::MoreUtils'                  => 0.22,
        'File::Path'                       => 2.07,
        'Module::Find'                     => 0.06,
        'Class::C3'                        => 0.21,
        'Params::Validate'                 => 0.91,
        'Clone'                            => 0.31,
        'JavaScript::Packer'               => 1.002,
        'CSS::Packer'                      => 1.000,
        'HTML::Packer'                     => 1.000,
        'Business::Tax::VAT::Validation'   => 0.20,
        'Crypt::SSLeay'                    => 0.57,
        'Scope::Guard'                     => 0.20,
        'Digest::SHA'                      => 5.47,
        'CSS::Minifier::XS'                => 0.03,
        'JavaScript::Minifier::XS'         => 0.05,
        'Readonly'                         => 1.03,
        'Moose'                            => 0.93,
        'MooseX::Storage'                  => 0.23,
        'MooseX::NonMoose'                 => 0.07,
        'MooseX::Storage::Format::JSON'    => 0.27,
        'namespace::autoclean'             => 0.09,
        'Business::PayPal::API'            => 0.62,
        'Locales'                          => 0.10,
        'Test::Harness'                    => 3.17,
        'DateTime::Event::ICal'            => 0.10,
        'Cache::FastMmap'                  => 1.35,
        'Test::Log::Dispatch'              => 0,
        'CHI'                              => 0.34,
        'IO::Socket::SSL'                  => 0,
        'Package::Stash'                   => 0,
        'HTTP::Exception'                  => 0,
        'Net::Twitter'                     => 3.13006,
        'PerlIO::eol'                      => 0.14,
        'Number::Format'                   => 0,
        'Email::Valid'                     => 0,
        'Facebook::Graph'                  => 0.0505,
        'HTTP::BrowserDetect'              => 1.19,
        'Search::QueryParser'              => 0,
        'Monkey::Patch'                    => 0.03,
        'UUID::Tiny'                       => 1.03,
        'App::Cmd'                         => 0.311,
        'Devel::StackTrace'                => 1.27,
        'Devel::StackTrace::WithLexicals'  => 0.03,
        'Data::ICal'                       => 0.16,
        'Geo::Coder::Googlev3'             => 0.07,
        'IO::File::WithPath'               => 0,
    },
    # actually test_requires
    build_requires => {
        'HTML::Form'                       => 5.800,
        'Test::More'                       => 0.96,
        'Test::MockObject'                 => 1.02,
        'Test::LongString'                 => 0.13,
        'Test::Exception'                  => 0.27,
        'Test::Differences'                => 0.5,
        'Test::Class'                      => 0.31,
        'Test::MockTime'                   => 0.09,
        'Pod::Coverage'                    => 0.19,
        'Text::Balanced'                   => 2.00,
        'Capture::Tiny'                    => 0.08,
    },
    recommends => {
        'HTML::Template::Expr'             => 0.07,
        'Template'                         => 2.20,
        'Starman'                          => 0.2010,
        'Text::Aspell'                     => 0.01,
    },
);
$build->notes('etc_dir' => "/etc/webgui");
$build->create_build_script;

