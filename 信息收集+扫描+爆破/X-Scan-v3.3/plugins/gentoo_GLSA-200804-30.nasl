# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200804-30.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(32111);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200804-30");
 script_cve_id("CVE-2008-1671");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200804-30 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200804-30
(KDE start_kdeinit: Multiple vulnerabilities)


    Vulnerabilities have been reported in the processing of user-controlled
    data by start_kdeinit, which is setuid root by default.
  
Impact

    A local attacker could possibly execute arbitrary code with root
    privileges, cause a Denial of Service or send Unix signals to other
    processes, when start_kdeinit is setuid root.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All kdelibs users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=kde-base/kdelibs-3.5.8-r4"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1671');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200804-30.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200804-30] KDE start_kdeinit: Multiple vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'KDE start_kdeinit: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "kde-base/kdelibs", unaffected: make_list("rge 3.5.8-r4", "rge 3.5.9-r3", "gt 4.0", "lt 3.5.5", "rge 3.5.10-r2"), vulnerable: make_list("lt 4.0")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
