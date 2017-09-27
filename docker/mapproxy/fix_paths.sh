for conf in /etc/vts/mapproxy/examples.d/*.json; do

        mv $conf /tmp/conf_in
        sed -e 's|examples/|/var/vts/mapproxy/datasets/|' /tmp/conf_in > $conf
done
                
