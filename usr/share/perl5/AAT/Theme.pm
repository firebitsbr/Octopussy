=head1 NAME

AAT::Theme - AAT Theme module

=cut
package AAT::Theme;

use strict;
use warnings;
use Readonly;

Readonly my $DIR_THEME => "AAT/THEMES/";

=head1 FUNCTIONS

=head2 List()

Returns list of available Themes

=cut
sub List()
{
	opendir(DIR, $DIR_THEME);
  my @themes = grep !/^\.+/, readdir(DIR);
  closedir(DIR);

	return (sort (@themes));
}

=head2 CSS_File($theme)

Returns CSS File Path for Theme '$theme'

=cut
sub CSS_File($)
{
	my $theme = shift;
	
	$theme = "DEFAULT"  if (AAT::NULL($theme));
	my $file = "$DIR_THEME$theme/style.css";
	return ("$file")	if (-f "$file");
	return (undef);
}

1;

=head1 SEE ALSO

AAT(3), AAT::DB(3), AAT::Syslog(3), AAT::Translation(3), AAT::User(3), AAT::XML(3)

=head1 AUTHOR

Sebastien Thebert <octo.devel@gmail.com>

=cut
