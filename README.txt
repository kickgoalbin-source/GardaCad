GARDA CAD - Police Computer Aided Dispatch
==========================================

SETUP
1. Extract this ZIP to a folder (e.g. Desktop\GardaCAD).
2. Double-click install.bat (installs Node.js if you don't have it).
3. Double-click Run.bat - the CAD opens on the login screen.
4. Stop.bat shuts the server down.

ADMIN LOGIN
  Username: GARDA-1234
  Password: 2245

FEATURES
- Login screen with logo; only valid accounts get in.
- Dashboard: type a name (e.g. "Sandra") and pick from the dropdown
  to see photo, name, age, DOB, height, address, description,
  warnings, past offences, vehicles and driver licence.
- Double-click / double-tap the licence card on a profile to jump to
  the full licence record in Vehicles.
- Vehicles: search by reg plate, name or licence number. Shows vehicle,
  tax/insurance/NCT, owner, penalty points and road traffic offences.
- Record actions (any officer): add penalty points (pick a common offence
  and the points/fine fill in; 12 points disqualifies automatically),
  add convictions, add or remove warning markers, register vehicles,
  update a vehicle's status (stolen, seize on sight, etc.) and change
  licence status. Admins can remove road traffic offences.
- Reports: arrest, incident, road traffic, collision, witness statement
  and search reports. Pick the person from a dropdown and their details,
  licence, markers and vehicle fill in automatically. Then write the
  title, details and full account. Save as a draft or submit.
  Submitting an arrest report can add the offences to the person's
  record; a road traffic report can add penalty points. Reports can be
  printed and show on the person's record.
- Control: log a call (look up the caller by name and their phone and
  address fill in, then add incident type, priority, address and what
  happened). Select a call on the board and use Attach Garda to assign
  an officer. A notification pops up in the bottom right of that officer's
  screen with the call, address and what happened, until they Acknowledge
  it. The board shows who has acknowledged. Calls can be closed with an
  outcome and keep a call log.
- Settings: change profile picture, change password, log out.
  Admins also get "Garda Accounts" (create/delete/reset officers)
  and "Civilian Profiles" (create/edit/delete people, photos,
  offences, licence, points and vehicles).

DATA
All data is saved in data\db.json. Back that file up to keep your records.
Delete it to reset to the sample data (Sandra Murphy, Sean O'Brien, Aoife Kelly).

LOGO
Replace public\logo.png with a higher quality version of your badge if you like.

OTHER DEVICES
By default the CAD only accepts connections from this PC.
To let officers on other PCs log in (so they get the pop-ups on their own
screen), set the HOST variable to 0.0.0.0 before starting the server
(e.g. edit Run.bat and add: set HOST=0.0.0.0), then open
http://<this PC's IP>:3000 on the other machines. Only do this on a
trusted network.

DESKTOP ALERTS (when you are in another app, e.g. Roblox)
Open Control and press "Enable desktop alerts" (then Allow), and use "Send test alert"
to check. Keep the CAD window open (minimised is fine, closed is not). Windows will
not show notifications over a true fullscreen game, so run Roblox in windowed or
borderless mode, and turn off Settings > System > Notifications > "Turn on Do not
disturb automatically > When I'm playing a game". The alert sound still plays.

HOSTING ON A REAL DOMAIN
- Desktop notifications and the background helper only work over HTTPS, so put the
  site behind HTTPS (a reverse proxy such as Nginx, Caddy or Cloudflare in front of
  the Node server). Plain http:// on a domain will not show desktop alerts.
- The server listens on 127.0.0.1:PORT by default, which is right when a reverse
  proxy runs on the same machine. Use HOST=0.0.0.0 only if the proxy is elsewhere.
- Live alerts use a long-lived connection (/api/stream). If your proxy buffers
  responses, turn that off for /api/stream (Nginx: proxy_buffering off; the server
  already sends X-Accel-Buffering: no). Without it alerts still arrive within
  about 3 seconds by polling.
- Change the default admin password (GARDA-1234 / 2245) before going live, and back
  up data/db.json regularly.
- Behind Cloudflare, purge the cache (Caching > Purge Everything) after uploading a new
  version, and keep file names lower case: public/logo.png (Linux is case-sensitive).
