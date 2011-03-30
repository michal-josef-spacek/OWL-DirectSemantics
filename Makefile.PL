use strict;
use warnings;

use inc::Module::Install;

my $dist = 'OWL-DirectSemantics';
my $fn   = "lib/$dist.pm"; $fn =~ s#-#/#g;

name                $dist;
perl_version_from   $fn;
version_from        $fn;
abstract_from       $fn;
readme_from         $fn;
author              'Toby Inkster <tobyink@cpan.org>';
license             'perl';

requires            'common::sense'      => '2';
requires            'Module::Pluggable'  => 0;
requires            'Moose'              => '1.02';
requires            'RDF::Trine'         => '0.133';
requires            'Scalar::Util'       => 0;
test_requires       'Test::More'         => '0.61';
requires            'URI'                => '1.30';

install_script 'rdf2owl';

resources(
	'homepage'   => "http://search.cpan.org/dist/$dist/",
	'repository' => "http://goddamn.co.uk/viewvc/perlmods/$dist/",
	'bugtracker' => "http://rt.cpan.org/Dist/Display.html?Queue=$dist",
	);

keywords("Perl");
	
write_doap_changes;
write_doap_changes_xml;

auto_install;
WriteAll(
	'meta' => 1,
	'sign' => 1,
	);
