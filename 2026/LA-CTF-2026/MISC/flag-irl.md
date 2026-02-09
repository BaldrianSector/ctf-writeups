# flag-irl

**Writeup by:** briatlon for [0-Day Aarhus](https://ctftime.org/team/251818/)

**Event:** LACTF 2026

**Solves:** 36 solves

**Author:** pstorm

## Prompt


With the generous help of the folks at 3D4E, I finally have a flag that can literally be captured! I made sure to [document this incredible accomplishment](https://www.youtube.com/watch?v=aKpsggYoVnc), though my microphone was busted.

*The following was added later…*

This is **not** an OSINT challenge, and the video is the only thing you need to solve the challenge. Please do not try to research the challenge author or any other organizations mentioned in the description. It will not help.


## Solve

The challenge consisted of a video of a 3D printer that over 8 minutes printed a physical flag. The twist was that the print wasn’t visible from the cameras angle. So the solve seemed pretty straightforward. Track the movement of the 3D printer and reconstruct the print and see the flag. Well... easier said than done 😆

I wasn’t sure that it was doable, so for good measure I checked the sound of the file and could confirm that it was dead silence. I visited 3D4E and saw they had custom printes, but I quickly realized that wasn’t going to give away the flag. I thought the print file was perhaps leaked online somewhere, but I was too excited to get started with the reconstruction. I saw the the challenge had few solves, so realized it might be worth the effort. 

I downloaded the video and ran some initial tracking in python. 



## Flag

`lactf{4n_irl_fla6_f0r_onc3}`