#!perl -T

use Test::More tests => 27;

use_ok('Number::Bytes::Human', 'format_bytes');

our @TESTS = (
  '0' => '0',
  '1' => '1',
  '-1' => '-1',
  '10' => '10',
  '100' => '100',
  '400' => '400',
  '500' => '500',
  '600' => '600',
  '900' => '900',
  '1000' => '1000',
  '2**10' => '1.0K',
  '1<<10' => '1.0K',
  '1023' => '1023',
  '1024' => '1.0K',
  '1025' => '1.1K',
  '2048' => '2.0K',
  '10*1024' => '10K',
  '10*1024+1' => '11K',
  '500*1024' => '500K',
  '1023*1024' => '1023K',
  '1023*1024+1' => '1.0M',
  '1024*1024' => '1.0M',
  '2**30' => '1.0G',
  '2**80' => '1.0Y',
  '1023*2**80' => '1023Y',
  #'1025*2**80' => '1025Y', # TODO
);

is(format_bytes(undef), undef, "undef is undef");

while (my ($exp, $expected) = splice @TESTS, 0, 2) {
  $num = eval $exp;
  is(format_bytes($num), $expected, "$exp is $expected");
}
