#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(19428);
 script_version("$Revision: 1.10 $");
 script_cve_id("CVE-2005-2551", "CVE-2006-2496");
 script_bugtraq_id(14548, 18026);
 script_xref(name:"OSVDB", value:"18703");
 script_xref(name:"OSVDB", value:"25781");

 script_name(english:"Novell eDirectory Server iMonitor Multiple Remote Overflows");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by a buffer overflow vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of eDirectory iMonitor which is
vulnerable to a remote buffer overflow.  An attacker may exploit this
flaw to execute arbitrary code on the remote host or to disable this
service remotely. 

To exploit this flaw, an attacker would need to send a specially
crafted packet to the remote service." );
 script_set_attribute(attribute:"solution", value:
"http://support.novell.com/cgi-bin/search/searchtid.cgi?/10098568.htm
http://www.zerodayinitiative.com/advisories/ZDI-06-016.html
http://support.novell.com/cgi-bin/search/searchtid.cgi?/2973759.htm" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );

script_end_attributes();

 
 script_summary(english:"Checks for a buffer overflow in eDirectory iMonitor");
 script_category(ACT_DENIAL);
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 script_family(english:"Gain a shell remotely");
 script_dependencie("http_version.nasl");
 script_require_ports("Services/www", 8008, 8010, 8028, 8030);
 exit(0);
}

# Check starts here

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:8008);
banner = get_http_banner (port:port);
if (egrep(pattern:"Server: .*HttpStk/[0-9]+\.[0-9]+", string:banner))
{

 if (http_is_dead(port:port))
   exit(0);

 r = http_send_recv3(method:"GET",item:"/nds/" + crap(data:"A", length:0x1500), port:port);

 if (http_is_dead(port:port))
   security_hole(port);
}
