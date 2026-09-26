/* === This file is part of Calamares - <https://calamares.io> ===
 *
 *   SPDX-FileCopyrightText: 2015 Teo Mrnjavac <teo@kde.org>
 *   SPDX-FileCopyrightText: 2018 Adriaan de Groot <groot@kde.org>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 *
 *   Calamares is Free Software: see the License-Identifier above.
 *
 */

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 10000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {
        Text {
            anchors.centerIn: parent
            textFormat: Text.PlainText
            font.pointSize: 16
            text: "Moobian is built using:\n\n" +
                  "- Debian Live-Build\n" +
                  "- Debian 13 (Trixie) as a base\n" +
                  "- GNOME desktop environment"
            horizontalAlignment: Text.Alignleft
        }
    }

    Slide {
        Text {
            anchors.centerIn: parent
            textFormat: Text.PlainText
            font.family: "monospace"
            font.pointSize: 12
            horizontalAlignment: Text.AlignLeft
                text: "         \\ | / \n" +
                      "       --- ☼ --- \n" +
                      "         / | \\ \n" +
                      "      ______________________\n" +
                      "     <      MOOOOOOO!       > \n" +
                      "      ---------------------- \n" +
                      "         \\\\   ^__^\n" +
                      "          \\\\  (oo)\\\\_______\n" +
                      "             (__)\\\\        )\\\\ \n" +
                      "                   ||---w  | \\\\ \n" +
                      "                   ||     ||      \n" +
                      ". . . . . . . . . . . . . . . . .  .\n" +
                      ".   v   v   v   v   v   v   v   v  .\n" +
                      ". . . . . . . . . . . . . . . .  . ."
        }
    }

    Slide {
        Text {
            anchors.centerIn: parent
            width: presentation.width * 0.9
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 11
            linkColor: "#2b6cb0"
            text: qsTr(
                "Moobian would not be possible without the work of the following projects and communities:<br/><br/>" +
                "<b><a href='https://www.debian.org/'>Debian Project</a></b> - Provides the base operating system, package repositories, and development infrastructure upon which Moobian is built.<br/><br/>" +
                "<b><a href='https://www.gnome.org/'>GNOME Project</a></b> - Provides the desktop environment and many of the core desktop applications included with Moobian.<br/><br/>" +
                "<b><a href='https://calamares.io/'>Calamares</a></b> - Provides the graphical system installer used by Moobian.<br/><br/>" +
                "<b><a href='https://github.com/debian-live/live-build'>Debian Live-Build</a></b> - Powers the creation and customization of Moobian installation images.<br/><br/>" +
                "<b><a href='https://github.com/torvalds/linux'>Linux Kernel Developers</a></b> - Maintain the Linux kernel that serves as the foundation of the operating system.<br/><br/>" +
                "A sincere thank you to all contributors, maintainers, designers, testers, and community members involved in these projects."
            )
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }

    // When this slideshow is loaded as a V1 slideshow, only
    // activatedInCalamares is set, which starts the timer (see above).
    //
    // In V2, also the onActivate() and onLeave() methods are called.
    // These example functions log a message (and re-start the slides
    // from the first).
    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }

    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }

}
