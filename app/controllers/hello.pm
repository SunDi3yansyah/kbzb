package app::controllers::hello; 

use kbzb::libraries::controller;
use kbzb::helpers::url qw( base_url );
use kbzb::helpers::string qw( random_string );
use Data::Dumper;

use base qw(kbzb::libraries::controller);
use strict;

my $v;

sub new
{
	my $class = shift; 

	my $self = $class->SUPER::new();
	bless($self, $class);
	return $self;
}



sub index
{
	my $self = shift; 
	my (@input) = @_; 
	
	my $c = $self->config();
	
	# $self->load->helper('url');
	
	my $bacon = { 'pack' => $self->{package}, me => $self, user => $>, url => base_url(), config => Dumper(kbzb::APPPATH()), coderef => $v };
	
	
	# my $v =  sub { $self->load->view(@_); };
	# $v->('welcome_message', $bacon);
	# print "Content-type: text/html\n\n";
	
	
	# $kbzb::out->append_output($self->tpl('welcome_message', 1));
	
	$self->render('welcome_message');
	
	# print "Content-type: text/html\n\n".$html;
	# $kbzb::out->append_output("something")
}

# this is a special kind of random string generator that always begins with a letter.
sub rand_id {
	my ($self, $length) = @_;
	if(!$length) { $length = 8; }
	my @start_chars = ('a'..'z', 'A'..'Z');
	my @run_chars = ('a'..'z', 'A'..'Z', '0'..'9');
	my $begin_char = $start_chars[int(rand(scalar(@start_chars)))];
	return $begin_char.join('', map { $run_chars[int(rand(scalar(@run_chars)))] } 1..($length - 1));	
}

sub unique_id {
	my($self) = @_;
	return random_string('alnum', 12);
}

1;
