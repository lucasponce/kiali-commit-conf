# kiali-commit-conf
Demo scripts used for Kiali Commit Conf talks


export to the PATH the istioctl


export PATH="$ISTIO_PATH/bin:$PATH"

![BookInfo App](https://istio.io/docs/examples/bookinfo/noistio.svg)

Create the namespace for BookInfo

1. [Step One](step_1) : Deploy BookInfo ProductPage and Details
1.1 [Step One Phase 2](step_1_1) : Deploy Traffic generator
2. [Step Two](step_2) : Deploy Ratings and Review V2
3. [Step Three](step_3) : Deploy BookInfo Review V3
4. [Step Four](step_4) : Deploy BookInfo ProductPage v2
5. [Step Five](step_5) : Deploy a destination rule to make slower request to ProductPage V2
5. [Step Five](step_6) : Deploy a destination rule to make abort 500 if region is spain