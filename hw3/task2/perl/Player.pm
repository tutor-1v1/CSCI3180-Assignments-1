# CSCI3180 Principles of Programming Languages
#
# --- Declaration ---
#
# I declare that the assignment here submitted is original except for source
# material explicitly acknowledged. I also acknowledge that I am aware of
# University policy and regulations on honesty in academic work, and of the
# disciplinary guidelines and procedures applicable to breaches of such policy
# and regulations, as contained in the website
# http://www.cuhk.edu.hk/policy/academichonesty/
#
# Assignment 3
# Name : Chao Yu
# Student ID : 1155053722
# Email Addr : ychao5@cse.cuhk.edu.hk

use strict;
use warnings;
package Player;
our $due = 200;
our $income = 0;
our $tax_rate = 0.2;
our $handling_fee_rate = 0;
our $prison_rounds = 2;

# you are not allowed to modify this class!
sub new
{
    my $class = shift;
    my $self = {
        name => shift,
        money => 100000,
        position => 0,
        num_rounds_in_jail => 0,
    };
    bless $self, $class;
    return $self;
}

sub move {
    my $self = shift;
    if ($self->{num_rounds_in_jail} > 0) {
        $self->{num_rounds_in_jail} -= 1;
    } else {
        my $step = shift;
        $self->{position} = ($self->{position} + $step) % $main::game_board_size;
    }
}

sub payDue {
    my $self = shift;
    $self->{money} += $income * (1 - $tax_rate);
    $self->{money} -= $due * (1 + $handling_fee_rate);
}

sub putToJail {
    my $self = shift;
    $self->{num_rounds_in_jail} = $prison_rounds;
}

sub printAsset {
    my $self = shift;
    print("Player $self->{name}'s money: $self->{money}\n");
}

1;