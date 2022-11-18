---
layout: post
title:  "Red, Blue and Purple Teams in Cyber Security"
tags: security
---

A red team exists to attack. A blue team to defend. A purple team is optionally set up to support the process.
The overall objective is to strengthen an organization's security by learning from the ensuing combat.

![Red, Blue and Purple Teams]({{ site.baseurl }}/assets/images/sec-rbp/teams.jpg)

## What is a Red Team in cyber security?
A red team exists to attack, it usually operates independently of a target organization. A red team is usually hired covertly to test defenses.
The core objective of this team is to identify and safely exploit vulnerabilities. They usually mimic sophisticated real-world threats.
The attack process is highly realistic. A red team uses bleeding-edge hacking tools and techniques to infiltrate the target.
This also includes writing their malware and devising new methods similar to malicious hackers.

Traditional pen-testers deploy loud (easily detectable) techniques, like vulnerability scanners to identify gaps in security.
In contrast, a red team is stealthy and will do everything it can to avoid detection. Red Team only needs to find the weakest link to break
target perimeters wide open. In a red team engagement, everything is allowed from spear-phishing to disguising as a delivery driver and entering
the target premise to discreetly insert a USB drive into unsuspecting employee devices.

### Red Team Objectives
- Compromising target's security by extracting info, infiltrating systems or breaching physical perimeters
- Avoiding detection by Blue Team
- Exploiting bugs and weaknesses in the target's infrastructure
- Initiating hostile activities

### Red Team Methods
- Initial reconnaissance - open source intelligence(OSINT)
- Deploying command-and-control servers(C&C OR C2) inside target's network
- Using decoys to throw off blue team
- Social engineering and phishing techniques
- Physical and Digital pen-testing

## What is a Blue Team in cyber security?
A blue team is an organization's own cybersecurity personnel, typically within a Security Operations Centre(SOC).
The SOC consists of highly trained analysts who work on defending and improving their organization's defenses around the clock.
The blue team is expected to detect, oppose and weaken the red team. They enhance their skills by going through mock attack scenarios.

Most modern threats like malware and phishing emails are stopped by automated tools on the network's perimeter.
The blue team adds human intelligence to existing tools and technologies. Blue team also works in both proactive and reactive modes.
The blue team will detect, identify and neutralize more sophisticated attacks preemptively.

### Blue Team Objectives
- Understand incidents and respond accordingly
- Identify suspicious activity
- Shutdown any form of compromise
- Identify red team command and control (C&C or C2) servers and block their connectivity to the target
- Undertake analysis and forensic testing for their organization

### Blue Team Methods
- Log data review and analysis
- Using security information and event management (SIEM) platform for visibility and detection of live intrusions and to triage alarms in real-time
- Gathering new threat intelligence information and prioritizing appropriate actions to mitigate risks
- Performing traffic and data flow analysis

## What is a Purple Team in cyber security?
A purple team is not permanent, it has a transient function to oversee and optimize the red and blue team exercise.
If the red and blue teams work well, a purple team may become redundant. Red and Blue teams usually have friction giving rise to the need of purple team.
Purple teams are more a concept than a function, driving the red team to test and target specific elements of the blue team's defence and detection
capabilities.

### Purple Team Objectives
- Work alongside both the red and blue team
- Analyze and recommend necessary adjustments to both teams
- Taking responsibility for both teams and having a big picture
- Analyzing results and overseeing necessary remedial actions

The following matrix should help clarify the differences between different teams.

![Team difference matrix]({{ site.baseurl }}/assets/images/sec-rbp/difference.png)