package OWL::DirectSemantics::Element::Ontology;

use 5.008;
use common::sense;

our $VERSION;
BEGIN { $VERSION = "0.000_01"; }

use Moose;

extends 'OWL::DirectSemantics::Element';
with 'OWL::DirectSemantics::Writer::Dump';
with 'OWL::DirectSemantics::Writer::FunctionalSyntax';

has 'ontologyURI' => (is => 'rw', isa => 'RDF::Trine::Node');
has 'versionURI'  => (is => 'rw', isa => 'RDF::Trine::Node');
has 'imports' => (
	is         => 'rw',
	isa        => 'ArrayRef',
	auto_deref => 1,
	default    => sub{[]},
	traits     => ['Array'],
	handles    => { add_import => 'push' },
	);
has 'annotations' => (
	is         => 'rw',
	isa        => 'ArrayRef',
	auto_deref => 1,
	default    => sub{[]},
	traits     => ['Array'],
	handles    => { add_annotation => 'push' },
	);
has 'axioms' => (
	is         => 'rw',
	isa        => 'ArrayRef',
	auto_deref => 1,
	default    => sub{[]},
	traits     => ['Array'],
	handles    => { add_axiom => 'push' },
	);

sub fs_arguments
{
	my ($self) = @_;
	if ($self->versionURI && $self->ontologyURI)
	{
		return ($self->ontologyURI, $self->versionURI, @{$self->imports});
	}
	if ($self->ontologyURI)
	{
		return ($self->ontologyURI, @{$self->imports});
	}
	return @{$self->imports};
}

1;

__END__

=head1 NAME

OWL::DirectSemantics::Element::Ontology - represents an OWL Ontology

=head1 DESCRIPTION

This class represents the Ontology element in OWL Direct Semantics.

This class inherits from OWL::DirectSemantics::Element.

It does the OWL::DirectSemantics::Writer::FunctionalSyntax and
OWL::DirectSemantics::Writer::Dump roles.

=head2 Attributes

=over

=item C<< annotations >>

A list of annotations associated with this object.
The value is a ArrayRef.

=item C<< axioms >>

A list of axioms for the ontology.
The value is a ArrayRef.

=item C<< imports >>

A list of imported ontologies.
The value is a ArrayRef.

=item C<< ontologyURI >>

A URI identifying the ontology.
The value is a RDF::Trine::Node.

=item C<< versionURI >>

A URI identifying the version of the ontology.
The value is a RDF::Trine::Node.



=back

=head1 SEE ALSO

L<OWL::DirectSemantics>,
L<OWL::DirectSemantics::Element>.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT

Copyright 2011 Toby Inkster

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

