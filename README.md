# fx-menu
RedM Menu System

# insatallation

- `ensure fx-menu` in the top of your resources.cfg 

# features
- Custom designe Fixitfy.
- Very easy to use.
- To use the icons you can use your png names in the file path "vorp_inventory/html/img/items" for vorpcore. For example icon = "cash"
- If you are using another framework, update the openmenu function in client/main.lua line 13 for the icons file path

# Credit
* credit goes to the QBCORE and RSGCore team for basecode and functionality
# Example
```lua
RegisterCommand('testmenu', function(args)
    exports['fx-menu']:openMenu({
        {
            header = "Fixitfy Menu",
            isMenuHeader = true,
        },
        {
            header = "Player's ID: 1",
            txt = "Fixitfy Dev",
            icon   = 'confirm',
            params = {
                event = "",
                isServer = false,
                args = {},
            }
        },
        {
            header = "Player's Job",
            txt = "Sheriff",
            icon   = 'badge',
            params = {
                event = "",
                isServer = false,
                args = {},
            }
        },
        {
            header = "Player's Cash",
            txt = "2500 $",
            icon   = 'money',
            params = {
                event = "",
                isServer = false,
                args = {},
            }
        },
        {
            header = "Player's Gold",
            txt = "100 Gold",
            icon = 'goldbar',
            params = {
                event = "",
                isServer = false,
                args = {},
            }
        },
        {
            header =  "Close Menu",
            txt = 'Exit',
            icon = "cancel",
            params = {
                event = 'fx-menu:closeMenu',
            }
        },
    })
end)
```
# Media
![fixit](https://github.com/Fixitfy/fx-menu/assets/139653962/bde42eec-b1d3-416b-93d5-d5ad5d9d6277)
![Screenshot_381](https://github.com/Fixitfy/fx-menu/assets/139653962/6927e1be-ae3a-4d05-8ace-c8f4dcae8a05)

