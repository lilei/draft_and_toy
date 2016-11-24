
use 5.010;

package Point;
use Moose;
has 'x' => (is => 'rw', isa => 'Int');
has 'y' => (is => 'rw', isa => 'Int');
has 'z' => (is => 'rw', isa => 'Int');

sub clear{
  my $self = shift;
  $self->x(0);
  $self->y(0);
};

sub BUILD{
  say 'construct here';
  my $self = shift;
  $self->x(1);
  $self->y(1);
  $self->z($self->x + $self->y);
  say $self->x;
}

sub print{
  my $self = shift;
  say 'z = ',$self->z;
}
1;
