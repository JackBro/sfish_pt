#
# This script was written by Renaud Deraison <deraison@cvs.nessus.org>
#
# See the Nessus Scripts License for details
#
# Refs: http://www.frog-man.org/tutos/WihPhoto.txt
#
# From: "Frog Man" <leseulfrog@hotmail.com>
# To: bugtraq@securityfocus.com
# Subject: [VulnWatch] WihPhoto (PHP)
# Message-ID: <F1195Iw7bEtfjKNE0500000ecbd@hotmail.com>
#

if(description)
{
 script_id(11274);
 script_bugtraq_id(6929);
 script_version ("$Revision: 1.7 $");
 
 name["english"] = "WihPhoto file reading";

 script_name(english:name["english"]);
 
 desc["english"] = "
It is possible to make the remote host mail any file contained
on its hard drive by using a flaw in WihPhoto.

Solution : At this time, the vendor did not supply any patch
See also : http://www.frog-man.org/tutos/WihPhoto.txt (french)
Risk factor : High";




 script_description(english:desc["english"]);
 
 summary["english"] = "Checks for the presence of remotehtmlview.php";
 
 script_summary(english:summary["english"]);
 
 script_category(ACT_ATTACK);
 
 
 script_copyright(english:"This script is Copyright (C) 2003 Renaud Deraison",
		francais:"Ce script est Copyright (C) 2003 Renaud Deraison");
 family["english"] = "CGI abuses";
 family["francais"] = "Abus de CGI";
 script_family(english:family["english"], francais:family["francais"]);
 script_dependencie("find_service.nes", "http_version.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

#
# The script code starts here
#


include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(!get_port_state(port))exit(0);
if(!can_host_php(port:port))exit(0);



function check(loc)
{
 req = http_get(item:string(loc, "/start.php"),
 		port:port);
 r = http_keepalive_send_recv(port:port, data:req);
 if( r == NULL )exit(0);
 if(egrep(pattern:"WihPhoto 0\.([0-9][^0-9]|[0-7][0-9][^0-9]|8[0-6][^0-9])", string:r))
 {
 	security_hole(port);
	exit(0);
 }
}


dir = make_list(cgi_dirs());
foreach d (dir)
{
 if(isnull(dirs))dirs = make_list(string(d, "/wihphoto"), string(d, "/WihPhoto"));
 else dirs = make_list(dirs, string(d, "/wihphoto"), string(d, "/WihPhoto"));
}

dirs = make_list(dirs, "/wihphoto", "/WihPhoto");


foreach dir (dirs)
{
check(loc:dir);
}
