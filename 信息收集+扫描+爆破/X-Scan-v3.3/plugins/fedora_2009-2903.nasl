
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-2903
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(37136);
 script_version ("$Revision: 1.2 $");
script_name(english: "Fedora 10 2009-2903: lcms");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-2903 (lcms)");
 script_set_attribute(attribute: "description", value: "LittleCMS intends to be a small-footprint, speed optimized color management
engine in open source form.

-
ChangeLog:


Update information :

* Mon Mar 23 2009 kwizart < kwizart at gmail.com > - 1.18-1
- Update to 1.18 (final)
- Remove upstreamed patches
- Disable autoreconf - patch libtool to prevent rpath issue
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2009-0581", "CVE-2009-0723", "CVE-2009-0733");
script_summary(english: "Check for the version of the lcms package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"lcms-1.18-1.fc10", release:"FC10") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
