/* Simple Chat
 * Copyright (c) 2008-2014 Alexander Sedov <imp@schat.me>
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef SERVERMENUIMPL_H_
#define SERVERMENUIMPL_H_

#include "interfaces/IChannelMenu.h"

class ServerMenuImpl : public QObject, public IChannelMenu
{
  Q_OBJECT

public:
  ServerMenuImpl(QObject *parent = 0);

protected:
  bool trigger(QAction *action) Q_DECL_OVERRIDE;
  void bind(QMenu *menu, ClientChannel channel, Scope scope) Q_DECL_OVERRIDE;
  void cleanup() Q_DECL_OVERRIDE;

private:
  QAction *m_alerts;
  QAction *m_info;
};

#endif /* SERVERMENUIMPL_H_ */
