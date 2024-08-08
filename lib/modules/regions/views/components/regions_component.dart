import '../../../../core/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/view/views.dart';
import '../../../../di_container.dart';
import '../../controllers/regions_controller.dart';
import '../../models/region_model.dart';

class RegionsComponent extends StatefulWidget {
  final int? countryInitId;
  final int? stateInitId;
  final int? cityInitId;
  final void Function(Region region) onChangeCountry;
  final void Function(Region region) onChangeState;
  final void Function(Region region) onChangeCity;

  const RegionsComponent({
    this.countryInitId,
    this.stateInitId,
    this.cityInitId,
    required this.onChangeCountry,
    required this.onChangeState,
    required this.onChangeCity,
    super.key,
  });

  @override
  State<RegionsComponent> createState() => _RegionsComponentState();
}

class _RegionsComponentState extends State<RegionsComponent> {
  final RegionsController regionsController = Get.put(sl<RegionsController>());
  Region? country;
  Region? state;
  Region? city;

  @override
  void initState() {
    super.initState();
    regionsController.getCountries().then((value) {
      if (widget.countryInitId != null) {
        country = regionsController.countries.singleWhere((c) => c.id == widget.countryInitId);
      }
    });

    if (widget.countryInitId != null) {
      regionsController.getStates(widget.countryInitId!).then((value) {
        if (widget.stateInitId != null) {
          state = regionsController.states.singleWhere((c) => c.id == widget.stateInitId);
        }
      });
    }

    if (widget.stateInitId != null) {
      regionsController.getCities(widget.stateInitId!).then((value) {
        if (widget.cityInitId != null) {
          city = regionsController.cities.singleWhere((c) => c.id == widget.cityInitId);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CustomDropDownField<int>(
            key: UniqueKey(),
            hintText: AppStrings.country.tr,
            isLoadingValues: regionsController.isLoadingCountries.value,
            value: country?.id,
            onChanged: (id) {
              country = regionsController.countries.singleWhere((country) => country.id == id);
              widget.onChangeCountry(country!);
              state = null;
              city = null;
              regionsController.states.clear();
              regionsController.getStates(country!.id);
            },
            validator: Validators.notEmptyIntValidator,
            items: regionsController.countries
                .map((country) => DropdownMenuItem(value: country.id, child: DropDownTitle(title: country.name)))
                .toList(),
          ),
          VerticalSpace(24.v),
          CustomDropDownField<int>(
            key: UniqueKey(),
            hintText: AppStrings.state.tr,
            isLoadingValues: regionsController.isLoadingStates.value,
            value: state?.id,
            onChanged: (id) {
              state = regionsController.states.singleWhere((state) => state.id == id);
              widget.onChangeState(state!);
              city = null;
              regionsController.getCities(state!.id);
            },
            validator: Validators.notEmptyIntValidator,
            items: regionsController.states
                .map((state) => DropdownMenuItem(value: state.id, child: DropDownTitle(title: state.name)))
                .toList(),
          ),
          VerticalSpace(24.v),
          CustomDropDownField<int>(
            key: UniqueKey(),
            hintText: AppStrings.city.tr,
            isLoadingValues: regionsController.isLoadingCities.value,
            value: city?.id,
            onChanged: (id) {
              city = regionsController.cities.singleWhere((city) => city.id == id);
              widget.onChangeCity(city!);
            },
            // validator: Validators.notEmptyIntValidator,
            items: regionsController.cities
                .map((city) => DropdownMenuItem(value: city.id, child: DropDownTitle(title: city.name)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class DropDownTitle extends StatelessWidget {
  final String title;

  const DropDownTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontFamily: FontConstants.englishFontFamily,
            fontSize: FontSize.s14,
            fontWeight: FontWeightManager.regular,
          ),
    );
  }
}
