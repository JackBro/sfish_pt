
#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41366);
 script_version("$Revision: 1.2 $");
 script_name(english: "SuSE Security Update:  acroread_ja (2009-05-19)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing a security patch for acroread_ja");
 script_set_attribute(attribute: "description", value: "This update of acroread fixes two vulnerabilities in the
JavaScript API that allow attackers to execute arbitrary
code with a malformed PDF file.
(CVE-2009-1492,CVE-2009-1493)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Run yast to install the security patch for acroread_ja");
script_set_attribute(attribute: "see_also", value: "https://bugzilla.novell.com/show_bug.cgi?id=499097");
script_end_attributes();

 script_cve_id("CVE-2009-1492", "CVE-2009-1493");
script_summary(english: "Check for the acroread_ja package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"acroread_ja-8.1.5-0.1.1", release:"SLED11", cpu:"i586") )
{
	security_hole(port:0, extra:rpm_report_get() );
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
