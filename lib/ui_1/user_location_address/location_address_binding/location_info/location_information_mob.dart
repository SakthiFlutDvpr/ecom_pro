import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/location_info/location_info_bloc.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';

class LocationInformationPage extends CoreWidgets {
  const LocationInformationPage({super.key});

  @override
  CoreWidgetsState<LocationInformationPage> createState() =>
      _LocationInformationPageState();
}

class _LocationInformationPageState
    extends CoreWidgetsState<LocationInformationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<LocationInfoBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<LocationInfoBloc>().add(GetLocationData(context));
          debugPrint("locality123 : ${context.read<LocationInfoBloc>().place}");
        }
        return state is SuccessState
            ? FlutterScaffold(
                isAppBar: true,
                greenBackground: false,
                backgroundVectorCurve: false,
                toolBarTitleString: "Location Information",
                toolBarIconEnum: IconEnum.back,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: size.height * 0.75,
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          controller =
                              context.read<LocationInfoBloc>().controller!;
                        },
                        onTap: (latlng) {
                          context
                              .read<LocationInfoBloc>()
                              .add(PlaceMarkerOnTap(latLng: latlng));
                        },
                        circles: context.read<LocationInfoBloc>().circle,
                        markers: context.read<LocationInfoBloc>().marker,
                        initialCameraPosition: CameraPosition(
                          zoom: 18.0,
                          target: LatLng(
                              context
                                  .read<LocationInfoBloc>()
                                  .locationCoordinates!
                                  .latitude!,
                              context
                                  .read<LocationInfoBloc>()
                                  .locationCoordinates!
                                  .longitude!),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ListTile(
                            title: Text(
                              context.read<LocationInfoBloc>().place!.locality!,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            subtitle: Text(
                              context
                                  .read<LocationInfoBloc>()
                                  .place!
                                  .postalCode!,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: SelorgElevatedButton(
                                onTap: () {},
                                text: "Add Address To Proceed",
                                size: 12.sp,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
