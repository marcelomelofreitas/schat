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

#ifndef SETTINGSPAGE_H_
#define SETTINGSPAGE_H_

#include <QWidget>

#include "schat.h"

class QCheckBox;
class QLineEdit;
class QPushButton;
class Settings;

class SettingsPage : public QWidget
{
  Q_OBJECT

public:
  static const QString kApp;

  SettingsPage(Settings *settings, QWidget *parent = 0);

protected:
  void changeEvent(QEvent *event) Q_DECL_OVERRIDE;

private slots:
  void onAutoRunClicked(bool checked);
  void save();

private:
  bool isAutoRun() const;
  void retranslateUi();

  QCheckBox *m_autoRun;
  QCheckBox *m_consoleBtn;
  Settings *m_settings;
};

#endif /* SETTINGSPAGE_H_ */
