#
# (C) Tenable Network Security, Inc.
#

if ( NASL_LEVEL < 3000 )exit(0);


include("compat.inc");

if(description)
{
 script_id(33870);
 script_version("$Revision: 1.6 $");

 script_cve_id("CVE-2008-2463");
 script_bugtraq_id(30114);
 script_xref(name:"OSVDB", value:"46749");

 name["english"] = "MS08-041: Vulnerability in the ActiveX Control for the Snapshot Viewer for Microsoft Access Could Allow Remote Code Execution (955617)";

 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"Arbitrary code can be executed on the remote host through the web
client." );
 script_set_attribute(attribute:"description", value:
"The remote host contains a version of the ActiveX control for the
Snapshot Viewer for Microsoft Access which is vulnerable to a security
flaw which may allow an attacker to execute arbitrary code on the
remote host by constructing a malicious web page and entice a victim
to visit it." );
 script_set_attribute(attribute:"solution", value:
"Microsoft has released a set of patches for Microsoft Office 2000, XP
and 2003 :

http://www.microsoft.com/technet/security/bulletin/ms08-041.mspx" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );



script_end_attributes();

 
 summary["english"] = "Determines the presence of update 955617";

 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");
 family["english"] = "Windows : Microsoft Bulletins";
 script_family(english:family["english"]);
 
 script_dependencies("smb_hotfixes.nasl");
 script_require_keys("SMB/Registry/Enumerated");
 script_require_ports(139, 445);
 exit(0);
}


include("smb_hotfixes_fcheck.inc");
include("smb_hotfixes.inc");
include("smb_func.inc");


if (is_accessible_share())
{
 path1 = hotfix_get_commonfilesdir() + "\Microsoft Shared\Snapshot Viewer";
 path2 = hotfix_get_commonfilesdir() + "\System";
 if ( hotfix_check_fversion (path:path1, file:"snapview.ocx", version:"11.0.8228.0" )  == HCF_OLDER || 
      hotfix_check_fversion (path:path2, file:"snapview.ocx", version:"11.0.8228.0" )  == HCF_OLDER )
 {
 set_kb_item(name:"SMB/Missing/MS08-041", value:TRUE);
 hotfix_security_hole();
 }
 
 hotfix_check_fversion_end(); 
 exit (0);
}
