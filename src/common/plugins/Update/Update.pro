# Simple Chat
# Copyright (c) 2008-2014 Alexander Sedov <imp@schat.me>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.

SCHAT_CLIENT_LIB = 1
SCHAT_CORE_LIB = 1
QT = core gui webkit

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets webkitwidgets

HEADERS  = \
   HashRunnable.h \
   UpdatePlugin.h \
   UpdatePlugin_p.h \
   UpdateSettings.h \
   UpdateWidget.h \

SOURCES  = \
   HashRunnable.cpp \
   UpdatePlugin.cpp \
   UpdateSettings.cpp \
   UpdateWidget.cpp \

RESOURCES += res/Update.qrc

TRANSLATIONS += res/translations/update_en.ts
TRANSLATIONS += res/translations/update_ru.ts
TRANSLATIONS += res/translations/update_uk.ts

include(../plugins.pri)
