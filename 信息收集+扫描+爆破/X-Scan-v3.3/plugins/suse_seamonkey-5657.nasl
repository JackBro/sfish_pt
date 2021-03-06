
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(34360);
 script_version ("$Revision: 1.3 $");
 script_name(english: "SuSE Security Update:  seamonkey: Update to 1.1.12 security update version (seamonkey-5657)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch seamonkey-5657");
 script_set_attribute(attribute: "description", value: "This patch updates Seamonkey to version 1.1.12, fixing
security and other bugs:

MFSA 2008-45 / CVE-2008-4069: XBM image uninitialized
memory reading

MFSA 2008-44 / CVE-2008-4067 / CVE-2008-4068: resource:
traversal vulnerabilities

MFSA 2008-43: BOM characters stripped from JavaScript
before execution CVE-2008-4065: Stripped BOM characters bug
CVE-2008-4066: HTML escaped low surrogates bug

MFSA 2008-42 Crashes with evidence of memory corruption
(rv:1.9.0.2/1.8.1.17): CVE-2008-4061: Jesse Ruderman
reported a crash in the layout engine. CVE-2008-4062: Igor
Bukanov, Philip Taylor, Georgi Guninski, and Antoine Labour
reported crashes in the JavaScript engine. CVE-2008-4063:
Jesse Ruderman, Bob Clary, and Martijn Wargers reported
crashes in the layout engine which only affected Firefox 3.
CVE-2008-4064: David Maciejak and Drew Yao reported crashes
in graphics rendering which only affected Firefox 3.

MFSA 2008-41 Privilege escalation via XPCnativeWrapper
pollution CVE-2008-4058: XPCnativeWrapper pollution bugs
CVE-2008-4059: XPCnativeWrapper pollution (Firefox 2)
CVE-2008-4060: Documents without script handling objects

MFSA 2008-40 / CVE-2008-3837: Forced mouse drag

MFSA 2008-38 / CVE-2008-3835:
nsXMLDocument::OnChannelRedirect() same-origin violation

MFSA 2008-37 / CVE-2008-0016: UTF-8 URL stack buffer
overflow

Details can be found here:
http://www.mozilla.org/security/known-vulnerabilities/seamon
key11.html
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch seamonkey-5657");
script_end_attributes();

script_cve_id("CVE-2008-4069", "CVE-2008-4067", "CVE-2008-4068", "CVE-2008-4065", "CVE-2008-4066", "CVE-2008-4061", "CVE-2008-4062", "CVE-2008-4063", "CVE-2008-4064", "CVE-2008-4058", "CVE-2008-4059", "CVE-2008-4060", "CVE-2008-3837", "CVE-2008-3835", "CVE-2008-0016");
script_summary(english: "Check for the seamonkey-5657 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"seamonkey-1.1.12-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"seamonkey-dom-inspector-1.1.12-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"seamonkey-irc-1.1.12-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"seamonkey-mail-1.1.12-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"seamonkey-spellchecker-1.1.12-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"seamonkey-venkman-1.1.12-0.1", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
