{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}:
{
  ath-tools = {
    pname = "ath-tools";
    version = "324903e86fbd30d601f404125da74b28d812be4b";
    src = fetchgit {
      url = "https://github.com/qca/qca-swiss-army-knife.git";
      rev = "324903e86fbd30d601f404125da74b28d812be4b";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-Gykx/uHPzbHPECtiCoRmo9YWxUpYc7Ky1lNBENLsRm4=";
    };
    date = "2026-04-15";
  };
  qebspil = {
    pname = "qebspil";
    version = "8e4d9e676a3b3afe136cda9b953a2139ff1a32d0";
    src = fetchgit {
      url = "https://github.com/stephan-gh/qebspil.git";
      rev = "8e4d9e676a3b3afe136cda9b953a2139ff1a32d0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-kWUXzeYWNxGgmjt/p9yozrWc5ouUs0XXBRfiFMlu+QQ=";
    };
    date = "2025-10-25";
  };
  slbounce = {
    pname = "slbounce";
    version = "v5";
    src = fetchFromGitHub {
      owner = "TravMurav";
      repo = "slbounce";
      rev = "v5";
      fetchSubmodules = false;
      sha256 = "sha256-w+0SKR0A/hcFU6iFEOgyG+vWwgAWF8h9D0/X7GSFm7w=";
    };
  };
}
