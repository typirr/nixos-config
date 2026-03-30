# Common configuration shared across all hosts
{ config, pkgs, ... }: {
  # Add system-wide settings here
  time.timeZone = "Africa/Cairo";
  i18n.defaultLocale = "en_US.UTF-8";
}
