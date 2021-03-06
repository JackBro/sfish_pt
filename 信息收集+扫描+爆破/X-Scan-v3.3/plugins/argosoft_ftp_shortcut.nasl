#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(15623);
 script_version("$Revision: 1.12 $");
 script_cve_id("CVE-2004-2672");
 script_bugtraq_id(11589);
 script_xref(name:"OSVDB", value:"11325");

 script_name(english:"ArGoSoft FTP Server .lnk Shortcut Upload Arbitrary File Manipulation");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote FTP server is affected by an unauthorized access issue." );
 script_set_attribute(attribute:"description", value:
"The remote host is running ArGoSoft FTP Server. 

It is reported that ArGoSoft FTP Server is prone to a vulnerability
that allows link upload.  An attacker, exploiting this flaw, may be
able to have read and write access to any files and directories on the
FTP server." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to ArGoSoft FTP 1.4.2.2 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 
 script_summary(english:"Gets the version of the remote ArGoSoft server");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 script_family(english:"FTP");
 script_dependencie("ftpserver_detect_type_nd_version.nasl");
 script_require_ports("Services/ftp", 21);
 exit(0);
}

# Check starts here

include("ftp_func.inc");


port = get_kb_item("Services/ftp");
if ( ! port ) port = 21;
if ( ! get_port_state(port) ) exit(0);

banner = get_ftp_banner(port:port);
if ( ! banner ) exit(0);

if (
  "ArGoSoft FTP Server" >< banner &&
  egrep(pattern:"^220 ArGoSoft FTP Server.*Version.*\(1\.([0-3]\..*|4\.[0-1]|4\.2\.[0-1])", string:banner)
) security_hole(port);



